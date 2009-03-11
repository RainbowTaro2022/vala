/* valaccodestructmodule.vala
 *
 * Copyright (C) 2006-2008  Jürg Billeter, Raffaele Sandrini
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 *	Raffaele Sandrini <raffaele@sandrini.ch>
 */

using GLib;

internal class Vala.CCodeStructModule : CCodeBaseModule {
	public CCodeStructModule (CCodeGenerator codegen, CCodeModule? next) {
		base (codegen, next);
	}

	public override void visit_struct (Struct st) {
		var old_type_symbol = current_type_symbol;
		var old_instance_struct = instance_struct;
		var old_instance_finalize_fragment = instance_finalize_fragment;
		current_type_symbol = st;
		instance_struct = new CCodeStruct ("_%s".printf (st.get_cname ()));
		instance_finalize_fragment = new CCodeFragment ();

		CCodeDeclarationSpace decl_space;
		if (st.access != SymbolAccessibility.PRIVATE) {
			decl_space = header_declarations;
		} else {
			decl_space = source_declarations;
		}

		if (st.access == SymbolAccessibility.PRIVATE
		    || st.source_reference.file.cycle == null) {
			// no file dependency cycle for private symbols
			decl_space.add_type_declaration (new CCodeTypeDefinition ("struct _%s".printf (st.get_cname ()), new CCodeVariableDeclarator (st.get_cname ())));
		}

		if (st.source_reference.comment != null) {
			decl_space.add_type_definition (new CCodeComment (st.source_reference.comment));
		}
		decl_space.add_type_definition (instance_struct);

		st.accept_children (codegen);

		if (st.is_disposable ()) {
			add_struct_copy_function (st);
			add_struct_destroy_function (st);
		}

		add_struct_dup_function (st);
		add_struct_free_function (st);

		current_type_symbol = old_type_symbol;
		instance_struct = old_instance_struct;
		instance_finalize_fragment = old_instance_finalize_fragment;
	}

	void add_struct_dup_function (Struct st) {
		var function = new CCodeFunction (st.get_dup_function (), st.get_cname () + "*");
		if (st.access == SymbolAccessibility.PRIVATE) {
			function.modifiers = CCodeModifiers.STATIC;
		}

		function.add_parameter (new CCodeFormalParameter ("self", "const " + st.get_cname () + "*"));

		if (st.access != SymbolAccessibility.PRIVATE) {
			header_declarations.add_type_member_declaration (function.copy ());
		} else {
			source_declarations.add_type_member_declaration (function.copy ());
		}

		var cblock = new CCodeBlock ();

		var cdecl = new CCodeDeclaration (st.get_cname () + "*");
		cdecl.add_declarator (new CCodeVariableDeclarator ("dup"));
		cblock.add_statement (cdecl);

		var creation_call = new CCodeFunctionCall (new CCodeIdentifier ("g_new0"));
		creation_call.add_argument (new CCodeConstant (st.get_cname ()));
		creation_call.add_argument (new CCodeConstant ("1"));
		cblock.add_statement (new CCodeExpressionStatement (new CCodeAssignment (new CCodeIdentifier ("dup"), creation_call)));

		if (st.is_disposable ()) {
			var copy_call = new CCodeFunctionCall (new CCodeIdentifier (st.get_copy_function ()));
			copy_call.add_argument (new CCodeIdentifier ("self"));
			copy_call.add_argument (new CCodeIdentifier ("dup"));
			cblock.add_statement (new CCodeExpressionStatement (copy_call));
		} else {
			var sizeof_call = new CCodeFunctionCall (new CCodeIdentifier ("sizeof"));
			sizeof_call.add_argument (new CCodeConstant (st.get_cname ()));

			var copy_call = new CCodeFunctionCall (new CCodeIdentifier ("memcpy"));
			copy_call.add_argument (new CCodeIdentifier ("dup"));
			copy_call.add_argument (new CCodeIdentifier ("self"));
			copy_call.add_argument (sizeof_call);
			cblock.add_statement (new CCodeExpressionStatement (copy_call));
		}

		cblock.add_statement (new CCodeReturnStatement (new CCodeIdentifier ("dup")));

		function.block = cblock;

		source_type_member_definition.append (function);
	}

	void add_struct_free_function (Struct st) {
		var function = new CCodeFunction (st.get_free_function (), "void");
		if (st.access == SymbolAccessibility.PRIVATE) {
			function.modifiers = CCodeModifiers.STATIC;
		}

		function.add_parameter (new CCodeFormalParameter ("self", st.get_cname () + "*"));

		if (st.access != SymbolAccessibility.PRIVATE) {
			header_declarations.add_type_member_declaration (function.copy ());
		} else {
			source_declarations.add_type_member_declaration (function.copy ());
		}

		var cblock = new CCodeBlock ();

		if (st.is_disposable ()) {
			var destroy_call = new CCodeFunctionCall (new CCodeIdentifier (st.get_destroy_function ()));
			destroy_call.add_argument (new CCodeIdentifier ("self"));
			cblock.add_statement (new CCodeExpressionStatement (destroy_call));
		}

		var free_call = new CCodeFunctionCall (new CCodeIdentifier ("g_free"));
		free_call.add_argument (new CCodeIdentifier ("self"));
		cblock.add_statement (new CCodeExpressionStatement (free_call));

		function.block = cblock;

		source_type_member_definition.append (function);
	}

	void add_struct_copy_function (Struct st) {
		var function = new CCodeFunction (st.get_copy_function (), "void");
		if (st.access == SymbolAccessibility.PRIVATE) {
			function.modifiers = CCodeModifiers.STATIC;
		}

		function.add_parameter (new CCodeFormalParameter ("self", "const " + st.get_cname () + "*"));
		function.add_parameter (new CCodeFormalParameter ("dest", st.get_cname () + "*"));

		if (st.access != SymbolAccessibility.PRIVATE) {
			header_declarations.add_type_member_declaration (function.copy ());
		} else {
			source_declarations.add_type_member_declaration (function.copy ());
		}

		var cblock = new CCodeBlock ();
		var cfrag = new CCodeFragment ();
		cblock.add_statement (cfrag);

		foreach (var f in st.get_fields ()) {
			if (f.binding == MemberBinding.INSTANCE) {
				CCodeExpression copy = new CCodeMemberAccess.pointer (new CCodeIdentifier ("self"), f.name);
				if (requires_copy (f.field_type))  {
					var this_access = new MemberAccess.simple ("this");
					this_access.value_type = get_data_type_for_symbol ((TypeSymbol) f.parent_symbol);
					this_access.ccodenode = new CCodeIdentifier ("(*self)");
					var ma = new MemberAccess (this_access, f.name);
					ma.symbol_reference = f;
					copy = get_ref_cexpression (f.field_type, copy, ma, f);
				}
				var dest = new CCodeMemberAccess.pointer (new CCodeIdentifier ("dest"), f.name);
				cblock.add_statement (new CCodeExpressionStatement (new CCodeAssignment (dest, copy)));

				var array_type = f.field_type as ArrayType;
				if (array_type != null) {
					for (int dim = 1; dim <= array_type.rank; dim++) {
						var len_src = new CCodeMemberAccess.pointer (new CCodeIdentifier ("self"), get_array_length_cname (f.name, dim));
						var len_dest = new CCodeMemberAccess.pointer (new CCodeIdentifier ("dest"), get_array_length_cname (f.name, dim));
						cblock.add_statement (new CCodeExpressionStatement (new CCodeAssignment (len_dest, len_src)));
					}
				}
			}
		}

		append_temp_decl (cfrag, temp_vars);
		temp_vars.clear ();

		function.block = cblock;

		source_type_member_definition.append (function);
	}

	void add_struct_destroy_function (Struct st) {
		var function = new CCodeFunction (st.get_destroy_function (), "void");
		if (st.access == SymbolAccessibility.PRIVATE) {
			function.modifiers = CCodeModifiers.STATIC;
		}

		function.add_parameter (new CCodeFormalParameter ("self", st.get_cname () + "*"));

		if (st.access != SymbolAccessibility.PRIVATE) {
			header_declarations.add_type_member_declaration (function.copy ());
		} else {
			source_declarations.add_type_member_declaration (function.copy ());
		}

		var cblock = new CCodeBlock ();

		cblock.add_statement (instance_finalize_fragment);

		function.block = cblock;

		source_type_member_definition.append (function);
	}
}

