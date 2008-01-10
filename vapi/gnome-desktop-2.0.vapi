/* gnome-desktop-2.0.vapi generated by lt-vapigen, do not modify. */

[CCode (cprefix = "Gnome", lower_case_cprefix = "gnome_")]
namespace Gnome {
	[CCode (cprefix = "GNOME_BG_COLOR_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum BGColorType {
		SOLID,
		H_GRADIENT,
		V_GRADIENT,
	}
	[CCode (cprefix = "GNOME_BG_PLACEMENT_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum BGPlacement {
		TILED,
		ZOOMED,
		CENTERED,
		SCALED,
		FILL_SCREEN,
	}
	[CCode (cprefix = "GNOME_DESKTOP_ITEM_ERROR_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum DesktopItemError {
		NO_FILENAME,
		UNKNOWN_ENCODING,
		CANNOT_OPEN,
		NO_EXEC_STRING,
		BAD_EXEC_STRING,
		NO_URL,
		NOT_LAUNCHABLE,
		INVALID_TYPE,
	}
	[CCode (cprefix = "GNOME_DESKTOP_ITEM_ICON_NO_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum DesktopItemIconFlags {
		KDE,
	}
	[CCode (cprefix = "GNOME_DESKTOP_ITEM_LAUNCH_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum DesktopItemLaunchFlags {
		ONLY_ONE,
		USE_CURRENT_DIR,
		APPEND_URIS,
		APPEND_PATHS,
		DO_NOT_REAP_CHILD,
	}
	[CCode (cprefix = "GNOME_DESKTOP_ITEM_LOAD_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum DesktopItemLoadFlags {
		ONLY_IF_EXISTS,
		NO_TRANSLATIONS,
	}
	[CCode (cprefix = "GNOME_DESKTOP_ITEM_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum DesktopItemStatus {
		UNCHANGED,
		CHANGED,
		DISAPPEARED,
	}
	[CCode (cprefix = "GNOME_DESKTOP_ITEM_TYPE_", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public enum DesktopItemType {
		NULL,
		OTHER,
		APPLICATION,
		LINK,
		FSDEVICE,
		MIME_TYPE,
		DIRECTORY,
		SERVICE,
		SERVICE_TYPE,
	}
	[CCode (cheader_filename = "libgnome/gnome-desktop-item.h")]
	public class BGClass {
	}
	[CCode (ref_function = "gnome_desktop_item_ref", unref_function = "gnome_desktop_item_unref", cheader_filename = "libgnome/gnome-desktop-item.h")]
	public class DesktopItem : GLib.Boxed {
		public bool attr_exists (string attr);
		public void clear_localestring (string attr);
		public void clear_section (string section);
		public weak Gnome.DesktopItem copy ();
		public int drop_uri_list (string uri_list, Gnome.DesktopItemLaunchFlags flags) throws GLib.Error;
		[NoArrayLength]
		public int drop_uri_list_with_env (string uri_list, Gnome.DesktopItemLaunchFlags flags, string[] envp) throws GLib.Error;
		public static GLib.Quark error_quark ();
		public bool exists ();
		public static weak string find_icon (Gtk.IconTheme icon_theme, string icon, int desired_size, int flags);
		public weak string get_attr_locale (string attr);
		public bool get_boolean (string attr);
		public Gnome.DesktopItemType get_entry_type ();
		public Gnome.DesktopItemStatus get_file_status ();
		public weak string get_icon (Gtk.IconTheme icon_theme);
		public weak GLib.List get_languages (string attr);
		public weak string get_localestring (string attr);
		public weak string get_localestring_lang (string attr, string language);
		public weak string get_location ();
		public weak string get_string (string attr);
		public weak string get_strings (string attr);
		public int launch (GLib.List file_list, Gnome.DesktopItemLaunchFlags flags) throws GLib.Error;
		public int launch_on_screen (GLib.List file_list, Gnome.DesktopItemLaunchFlags flags, Gdk.Screen screen, int workspace) throws GLib.Error;
		[NoArrayLength]
		public int launch_with_env (GLib.List file_list, Gnome.DesktopItemLaunchFlags flags, string[] envp) throws GLib.Error;
		public DesktopItem ();
		public DesktopItem.from_basename (string basename, Gnome.DesktopItemLoadFlags flags) throws GLib.Error;
		public DesktopItem.from_file (string file, Gnome.DesktopItemLoadFlags flags) throws GLib.Error;
		public DesktopItem.from_string (string uri, string string, long length, Gnome.DesktopItemLoadFlags flags) throws GLib.Error;
		public DesktopItem.from_uri (string uri, Gnome.DesktopItemLoadFlags flags) throws GLib.Error;
		public bool save (string under, bool force) throws GLib.Error;
		public void set_boolean (string attr, bool value);
		public void set_entry_type (Gnome.DesktopItemType type);
		public void set_launch_time (uint timestamp);
		public void set_localestring (string attr, string value);
		public void set_localestring_lang (string attr, string language, string value);
		public void set_location (string location);
		public void set_location_file (string file);
		public void set_string (string attr, string value);
		[NoArrayLength]
		public void set_strings (string attr, string[] strings);
	}
	[CCode (cheader_filename = "libgnome/gnome-desktop-item.h")]
	public class BG : GLib.Object {
		public bool changes_with_size ();
		public weak Gdk.Pixmap create_pixmap (Gdk.Window window, int width, int height, bool root);
		public weak Gdk.Pixbuf create_thumbnail (Gnome.ThumbnailFactory factory, Gdk.Screen screen, int dest_width, int dest_height);
		public void draw (Gdk.Pixbuf dest);
		public bool get_image_size (Gnome.ThumbnailFactory factory, int width, int height);
		public bool is_dark ();
		public BG ();
		public void set_color (Gnome.BGColorType type, Gdk.Color c1, Gdk.Color c2);
		public static void set_pixmap_as_root (Gdk.Screen screen, Gdk.Pixmap pixmap);
		public void set_placement (Gnome.BGPlacement placement);
		public void set_uri (string uri);
		public signal void changed ();
	}
	[CCode (cheader_filename = "libgnomeui/gnome-ditem-edit.h")]
	public class DItemEdit : Gtk.Notebook, Atk.Implementor, Gtk.Buildable {
		public void clear ();
		public weak Gnome.DesktopItem get_ditem ();
		public weak string get_icon ();
		public weak string get_name ();
		public void grab_focus ();
		public bool load_uri (string uri) throws GLib.Error;
		public DItemEdit ();
		public void set_directory_only (bool directory_only);
		public void set_ditem (Gnome.DesktopItem ditem);
		public void set_editable (bool editable);
		public void set_entry_type (string type);
		public signal void changed ();
		public signal void icon_changed ();
		public signal void name_changed ();
	}
	[CCode (cheader_filename = "libgnomeui/gnome-hint.h")]
	public class Hint : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public Hint (string hintfile, string title, string background_image, string logo_image, string startupkey);
	}
	public const string DESKTOP_ITEM_ACTIONS;
	public const string DESKTOP_ITEM_CATEGORIES;
	public const string DESKTOP_ITEM_COMMENT;
	public const string DESKTOP_ITEM_DEFAULT_APP;
	public const string DESKTOP_ITEM_DEV;
	public const string DESKTOP_ITEM_DOC_PATH;
	public const string DESKTOP_ITEM_ENCODING;
	public const string DESKTOP_ITEM_EXEC;
	public const string DESKTOP_ITEM_FILE_PATTERN;
	public const string DESKTOP_ITEM_FS_TYPE;
	public const string DESKTOP_ITEM_GENERIC_NAME;
	public const string DESKTOP_ITEM_HIDDEN;
	public const string DESKTOP_ITEM_ICON;
	public const string DESKTOP_ITEM_MIME_TYPE;
	public const string DESKTOP_ITEM_MINI_ICON;
	public const string DESKTOP_ITEM_MOUNT_POINT;
	public const string DESKTOP_ITEM_NAME;
	public const string DESKTOP_ITEM_NO_DISPLAY;
	public const string DESKTOP_ITEM_ONLY_SHOW_IN;
	public const string DESKTOP_ITEM_PATH;
	public const string DESKTOP_ITEM_PATTERNS;
	public const string DESKTOP_ITEM_READ_ONLY;
	public const string DESKTOP_ITEM_SORT_ORDER;
	public const string DESKTOP_ITEM_SWALLOW_EXEC;
	public const string DESKTOP_ITEM_SWALLOW_TITLE;
	public const string DESKTOP_ITEM_TERMINAL;
	public const string DESKTOP_ITEM_TERMINAL_OPTIONS;
	public const string DESKTOP_ITEM_TRY_EXEC;
	public const string DESKTOP_ITEM_TYPE;
	public const string DESKTOP_ITEM_UNMOUNT_ICON;
	public const string DESKTOP_ITEM_URL;
	public const string DESKTOP_ITEM_VERSION;
}
