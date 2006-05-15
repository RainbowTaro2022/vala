/* valaccodeblock.vala
 *
 * Copyright (C) 2006  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.

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
 */

using GLib;

namespace Vala {
	public class CCodeBlock : CCodeNode {
		List<string#># statements;
		
		public void add_statement (string statement) {
			statements.append (statement);
		}
		
		public override void write (CCodeWriter writer) {
			writer.write_begin_block ();
			foreach (string statement in statements) {
				writer.write_indent ();
				writer.write_string (statement);
				writer.write_string (";\n");
			}
			writer.write_end_block ();
		}
	}
}
