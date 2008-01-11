/* hildon-1.vapi generated by lt-vapigen, do not modify. */

[CCode (cprefix = "Hildon", lower_case_cprefix = "hildon_")]
namespace Hildon {
	[CCode (cprefix = "HILDON_CAPTION_POSITION_", cheader_filename = "hildon/hildon.h")]
	public enum CaptionIconPosition {
		LEFT,
		RIGHT,
	}
	[CCode (cprefix = "HILDON_CAPTION_", cheader_filename = "hildon/hildon.h")]
	public enum CaptionStatus {
		OPTIONAL,
		MANDATORY,
	}
	[CCode (cprefix = "HILDON_DATE_TIME_ERROR_", cheader_filename = "hildon/hildon.h")]
	public enum DateTimeError {
		NO_ERROR,
		MAX_HOURS,
		MAX_MINS,
		MAX_SECS,
		MAX_DAY,
		MAX_MONTH,
		MAX_YEAR,
		MIN_HOURS,
		MIN_MINS,
		MIN_SECS,
		MIN_DAY,
		MIN_MONTH,
		MIN_YEAR,
		EMPTY_HOURS,
		EMPTY_MINS,
		EMPTY_SECS,
		EMPTY_DAY,
		EMPTY_MONTH,
		EMPTY_YEAR,
		MIN_DURATION,
		MAX_DURATION,
		INVALID_CHAR,
		INVALID_DATE,
		INVALID_TIME,
	}
	[CCode (cprefix = "HILDON_NOTE_TYPE_", cheader_filename = "hildon/hildon.h")]
	public enum NoteType {
		CONFIRMATION,
		CONFIRMATION_BUTTON,
		INFORMATION,
		INFORMATION_THEME,
		PROGRESSBAR,
	}
	[CCode (cprefix = "HILDON_NUMBER_EDITOR_ERROR_", cheader_filename = "hildon/hildon.h")]
	public enum NumberEditorErrorType {
		MAXIMUM_VALUE_EXCEED,
		MINIMUM_VALUE_EXCEED,
		ERRONEOUS_VALUE,
	}
	[CCode (cprefix = "HILDON_WINDOW_CO_", cheader_filename = "hildon/hildon.h")]
	public enum WindowClipboardOperation {
		COPY,
		CUT,
		PASTE,
	}
	[CCode (cprefix = "HILDON_WIZARD_DIALOG_", cheader_filename = "hildon/hildon.h")]
	public enum WizardDialogResponse {
		CANCEL,
		PREVIOUS,
		NEXT,
		FINISH,
	}
	[CCode (cprefix = "HILDON_CALENDAR_", cheader_filename = "hildon/hildon.h")]
	[Flags]
	public enum CalendarDisplayOptions {
		SHOW_HEADING,
		SHOW_DAY_NAMES,
		NO_MONTH_CHANGE,
		SHOW_WEEK_NUMBERS,
		WEEK_START_MONDAY,
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Banner : Gtk.Window, Atk.Implementor, Gtk.Buildable {
		public void set_fraction (double fraction);
		public void set_icon (string icon_name);
		public void set_icon_from_file (string icon_file);
		public void set_markup (string markup);
		public void set_text (string text);
		public void set_timeout (uint timeout);
		public static weak Gtk.Widget show_animation (Gtk.Widget widget, string animation_name, string text);
		public static weak Gtk.Widget show_information (Gtk.Widget widget, string icon_name, string text);
		public static weak Gtk.Widget show_information_with_markup (Gtk.Widget widget, string icon_name, string markup);
		public static weak Gtk.Widget show_informationf (Gtk.Widget widget, string icon_name, string format);
		public static weak Gtk.Widget show_progress (Gtk.Widget widget, Gtk.ProgressBar bar, string text);
		[NoAccessorMethod]
		public weak bool is_timed { get; construct; }
		[NoAccessorMethod]
		public weak Gtk.Window parent_window { get; construct; }
		[NoAccessorMethod]
		public weak uint timeout { get; construct; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class BreadCrumbTrail : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public void clear ();
		public BreadCrumbTrail ();
		public void pop ();
		public void push (Hildon.BreadCrumb item, pointer id, GLib.DestroyNotify notify);
		public void push_icon (string text, Gtk.Widget icon, pointer id, GLib.DestroyNotify destroy);
		public void push_text (string text, pointer id, GLib.DestroyNotify notify);
		public signal bool crumb_clicked (pointer id);
		public signal void move_parent ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Calendar : Gtk.Widget, Atk.Implementor, Gtk.Buildable {
		public weak Gtk.Style header_style;
		public weak Gtk.Style label_style;
		public int selected_day;
		public weak int[] day_month;
		public int num_marked_dates;
		public weak int[] marked_date;
		public Hildon.CalendarDisplayOptions display_flags;
		public weak Gdk.Color[] marked_date_color;
		public weak Gdk.GC gc;
		public weak Gdk.GC xor_gc;
		public int focus_row;
		public int focus_col;
		public int highlight_row;
		public int highlight_col;
		public weak char[] grow_space;
		public void clear_marks ();
		public void freeze ();
		public void get_date (uint year, uint month, uint day);
		public Hildon.CalendarDisplayOptions get_display_options ();
		public bool mark_day (uint day);
		public Calendar ();
		public void select_day (uint day);
		public bool select_month (uint month, uint year);
		public void set_display_options (Hildon.CalendarDisplayOptions flags);
		public void thaw ();
		public bool unmark_day (uint day);
		[NoAccessorMethod]
		public weak int day { get; set; }
		[NoAccessorMethod]
		public weak int max_year { get; set; }
		[NoAccessorMethod]
		public weak int min_year { get; set; }
		[NoAccessorMethod]
		public weak int month { get; set; }
		[NoAccessorMethod]
		public weak bool no_month_change { get; set; }
		[NoAccessorMethod]
		public weak bool show_day_names { get; set; }
		[NoAccessorMethod]
		public weak bool show_heading { get; set; }
		[NoAccessorMethod]
		public weak bool show_week_numbers { get; set; }
		[NoAccessorMethod]
		public weak int week_start { get; set; }
		[NoAccessorMethod]
		public weak int year { get; set; }
		public signal void day_selected ();
		public signal void day_selected_double_click ();
		public signal void erroneous_date ();
		public signal void month_changed ();
		public signal void next_month ();
		public signal void next_year ();
		public signal void prev_month ();
		public signal void prev_year ();
		public signal void selected_date ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class CalendarPopup : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public void get_date (uint year, uint month, uint day);
		public CalendarPopup (Gtk.Window parent, uint year, uint month, uint day);
		public void set_date (uint year, uint month, uint day);
		[NoAccessorMethod]
		public weak int day { get; set; }
		[NoAccessorMethod]
		public weak uint max_year { set; }
		[NoAccessorMethod]
		public weak uint min_year { set; }
		[NoAccessorMethod]
		public weak int month { get; set; }
		[NoAccessorMethod]
		public weak int year { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Caption : Gtk.EventBox, Atk.Implementor, Gtk.Buildable {
		public bool get_child_expand ();
		public weak Gtk.Widget get_icon_image ();
		public Hildon.CaptionIconPosition get_icon_position ();
		public weak string get_label ();
		public float get_label_alignment ();
		public weak string get_separator ();
		public weak Gtk.SizeGroup get_size_group ();
		public Hildon.CaptionStatus get_status ();
		public bool is_mandatory ();
		public Caption (Gtk.SizeGroup group, string value, Gtk.Widget control, Gtk.Widget icon, Hildon.CaptionStatus flag);
		public void set_child_expand (bool expand);
		public void set_icon_image (Gtk.Widget icon);
		public void set_icon_position (Hildon.CaptionIconPosition pos);
		public void set_label (string label);
		public void set_label_alignment (float alignment);
		public void set_label_markup (string markup);
		public void set_separator (string separator);
		public void set_size_group (Gtk.SizeGroup new_group);
		public void set_status (Hildon.CaptionStatus flag);
		[NoAccessorMethod]
		public weak Gtk.Widget icon { get; set; }
		public weak Hildon.CaptionIconPosition icon_position { get; set; }
		public weak string label { get; set; }
		[NoAccessorMethod]
		public weak string markup { set; }
		public weak string separator { get; set; }
		public weak Gtk.SizeGroup size_group { get; set; }
		public weak Hildon.CaptionStatus status { get; set; }
		public signal void activate ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class CodeDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public void clear_code ();
		public weak string get_code ();
		public CodeDialog ();
		public void set_help_text (string text);
		public void set_input_sensitive (bool sensitive);
		public signal void input ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class ColorButton : Gtk.Button, Atk.Implementor, Gtk.Buildable {
		public void get_color (out Gdk.Color color);
		public bool get_popup_shown ();
		public ColorButton ();
		public ColorButton.with_color (Gdk.Color color);
		public void popdown ();
		public void set_color (Gdk.Color color);
		public weak Gdk.Color color { get; set; }
		public weak bool popup_shown { get; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class ColorChooser : Gtk.Widget, Atk.Implementor, Gtk.Buildable {
		public void get_color (out Gdk.Color color);
		public ColorChooser ();
		public virtual void set_color (Gdk.Color color);
		public weak Gdk.Color color { get; set; }
		public signal void color_changed ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class ColorChooserDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public void get_color (out Gdk.Color color);
		public ColorChooserDialog ();
		public void set_color (Gdk.Color color);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Controlbar : Gtk.Scale, Atk.Implementor, Gtk.Buildable {
		public int get_max ();
		public int get_min ();
		public int get_value ();
		public Controlbar ();
		public void set_max (int max);
		public void set_min (int min);
		public void set_range (int min, int max);
		public void set_value (int value);
		public weak int max { get; set; }
		public weak int min { get; set; }
		public weak int value { get; set; }
		public signal void end_reached (bool end);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class DateEditor : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public void get_date (uint year, uint month, uint day);
		public uint get_day ();
		public uint get_month ();
		public uint get_year ();
		public DateEditor ();
		public void set_date (uint year, uint month, uint day);
		public bool set_day (uint day);
		public bool set_month (uint month);
		public bool set_year (uint year);
		public weak uint day { get; set; }
		[NoAccessorMethod]
		public weak uint max_year { get; set; }
		[NoAccessorMethod]
		public weak uint min_year { get; set; }
		public weak uint month { get; set; }
		public weak uint year { get; set; }
		public signal bool date_error (Hildon.DateTimeError type);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class FindToolbar : Gtk.Toolbar, Atk.Implementor, Gtk.Buildable {
		public int get_active ();
		public bool get_active_iter (out Gtk.TreeIter iter);
		public int get_last_index ();
		public void highlight_entry (bool get_focus);
		public FindToolbar (string label);
		public FindToolbar.with_model (string label, Gtk.ListStore model, int column);
		public void set_active (int index);
		public void set_active_iter (Gtk.TreeIter iter);
		[NoAccessorMethod]
		public weak int column { get; set; }
		[NoAccessorMethod]
		public weak int history_limit { get; set construct; }
		[NoAccessorMethod]
		public weak string label { get; set construct; }
		[NoAccessorMethod]
		public weak Gtk.ListStore list { get; set; }
		[NoAccessorMethod]
		public weak int max_characters { get; set construct; }
		[NoAccessorMethod]
		public weak string prefix { get; set; }
		public signal void close ();
		public signal bool history_append ();
		public signal void invalid_input ();
		public signal void search ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class FontSelectionDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public weak string get_preview_text ();
		public FontSelectionDialog (Gtk.Window parent, string title);
		public void set_preview_text (string text);
		[NoAccessorMethod]
		public weak bool bold { get; set; }
		[NoAccessorMethod]
		public weak bool bold_set { get; set construct; }
		[NoAccessorMethod]
		public weak Gdk.Color color { get; set; }
		[NoAccessorMethod]
		public weak bool color_set { get; set construct; }
		[NoAccessorMethod]
		public weak string family { get; set; }
		[NoAccessorMethod]
		public weak bool family_set { get; set construct; }
		[NoAccessorMethod]
		public weak double font_scaling { get; set; }
		[NoAccessorMethod]
		public weak bool italic { get; set; }
		[NoAccessorMethod]
		public weak bool italic_set { get; set construct; }
		[NoAccessorMethod]
		public weak int position { get; set; }
		[NoAccessorMethod]
		public weak bool position_set { get; set construct; }
		public weak string preview_text { get; set; }
		[NoAccessorMethod]
		public weak int size { get; set; }
		[NoAccessorMethod]
		public weak bool size_set { get; set construct; }
		[NoAccessorMethod]
		public weak bool strikethrough { get; set; }
		[NoAccessorMethod]
		public weak bool strikethrough_set { get; set construct; }
		[NoAccessorMethod]
		public weak bool underline { get; set; }
		[NoAccessorMethod]
		public weak bool underline_set { get; set construct; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class GetPasswordDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public weak string get_password ();
		public GetPasswordDialog (Gtk.Window parent, bool get_old);
		public GetPasswordDialog.with_default (Gtk.Window parent, string password, bool get_old);
		public void set_caption (string new_caption);
		public void set_max_characters (int max_characters);
		public void set_message (string message);
		[NoAccessorMethod]
		public weak string caption_label { get; set; }
		[NoAccessorMethod]
		public weak bool get_old { get; construct; }
		[NoAccessorMethod]
		public weak int max_characters { get; set; }
		[NoAccessorMethod]
		public weak string message { get; set; }
		[NoAccessorMethod]
		public weak bool numbers_only { get; set; }
		[NoAccessorMethod]
		public weak string password { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class HVolumebar : Hildon.Volumebar, Atk.Implementor, Gtk.Buildable {
		public HVolumebar ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class LoginDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public weak string get_password ();
		public weak string get_username ();
		public LoginDialog (Gtk.Window parent);
		public LoginDialog.with_default (Gtk.Window parent, string name, string password);
		public void set_message (string msg);
		[NoAccessorMethod]
		public weak string message { get; set; }
		[NoAccessorMethod]
		public weak string password { get; set; }
		[NoAccessorMethod]
		public weak string username { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Note : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public Note.cancel_with_progress_bar (Gtk.Window parent, string description, Gtk.ProgressBar progressbar);
		public Note.confirmation (Gtk.Window parent, string description);
		public Note.confirmation_add_buttons (Gtk.Window parent, string description);
		public Note.confirmation_with_icon_name (Gtk.Window parent, string description, string icon_name);
		public Note.information (Gtk.Window parent, string description);
		public Note.information_with_icon_name (Gtk.Window parent, string description, string icon_name);
		public void set_button_text (string text);
		public void set_button_texts (string text_ok, string text_cancel);
		[NoAccessorMethod]
		public weak string description { get; set; }
		[NoAccessorMethod]
		public weak string icon { get; set; }
		[NoAccessorMethod]
		public weak Gtk.ProgressBar progressbar { get; set; }
		[NoAccessorMethod]
		public weak string stock_icon { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class NumberEditor : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public int get_value ();
		public NumberEditor (int min, int max);
		public void set_range (int min, int max);
		public void set_value (int value);
		public weak int value { get; set; }
		public signal bool range_error (Hildon.NumberEditorErrorType type);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Program : GLib.Object {
		public void add_window (Hildon.Window window);
		public bool get_can_hibernate ();
		public weak Gtk.Menu get_common_menu ();
		public weak Gtk.Toolbar get_common_toolbar ();
		public static weak Hildon.Program get_instance ();
		public bool get_is_topmost ();
		public void remove_window (Hildon.Window window);
		public void set_can_hibernate (bool can_hibernate);
		public void set_common_menu (Gtk.Menu menu);
		public void set_common_toolbar (Gtk.Toolbar toolbar);
		public weak bool can_hibernate { get; set; }
		public weak bool is_topmost { get; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class RangeEditor : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public int get_higher ();
		public int get_lower ();
		public int get_max ();
		public int get_min ();
		public void get_range (int start, int end);
		public weak string get_separator ();
		public RangeEditor ();
		public RangeEditor.with_separator (string separator);
		public void set_higher (int value);
		public void set_limits (int start, int end);
		public void set_lower (int value);
		public void set_max (int value);
		public void set_min (int value);
		public void set_range (int start, int end);
		public void set_separator (string separator);
		public weak int higher { get; set construct; }
		public weak int lower { get; set construct; }
		public weak int max { get; set construct; }
		public weak int min { get; set construct; }
		public weak string separator { get; set construct; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Seekbar : Gtk.Scale, Atk.Implementor, Gtk.Buildable {
		public uint get_fraction ();
		public int get_position ();
		public int get_total_time ();
		public Seekbar ();
		public void set_fraction (uint fraction);
		public void set_position (int time);
		public void set_total_time (int time);
		public weak double fraction { get; set; }
		public weak double position { get; set; }
		public weak double total_time { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class SetPasswordDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public weak string get_password ();
		public bool get_protected ();
		public SetPasswordDialog (Gtk.Window parent, bool modify_protection);
		public SetPasswordDialog.with_default (Gtk.Window parent, string password, bool modify_protection);
		public void set_message (string message);
		[NoAccessorMethod]
		public weak string message { get; set; }
		[NoAccessorMethod]
		public weak bool modify_protection { get; construct; }
		[NoAccessorMethod]
		public weak string password { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class SortDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public int add_sort_key (string sort_key);
		public int add_sort_key_reversed (string sort_key);
		public int get_sort_key ();
		public Gtk.SortType get_sort_order ();
		public SortDialog (Gtk.Window parent);
		public void set_sort_key (int key);
		public void set_sort_order (Gtk.SortType order);
		public weak int sort_key { get; set; }
		public weak Gtk.SortType sort_order { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class TimeEditor : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public uint get_duration_max ();
		public uint get_duration_min ();
		public bool get_duration_mode ();
		public void get_duration_range (uint min_seconds, uint max_seconds);
		public bool get_show_hours ();
		public bool get_show_seconds ();
		public uint get_ticks ();
		public void get_time (uint hours, uint minutes, uint seconds);
		public static void get_time_separators (Gtk.Label hm_sep_label, Gtk.Label ms_sep_label);
		public TimeEditor ();
		public void set_duration_max (uint duration_max);
		public void set_duration_min (uint duration_min);
		public void set_duration_mode (bool duration_mode);
		public void set_duration_range (uint min_seconds, uint max_seconds);
		public void set_show_hours (bool show_hours);
		public void set_show_seconds (bool show_seconds);
		public void set_ticks (uint ticks);
		public void set_time (uint hours, uint minutes, uint seconds);
		public weak uint duration_max { get; set; }
		public weak uint duration_min { get; set; }
		public weak bool duration_mode { get; set; }
		public weak bool show_hours { get; set; }
		public weak bool show_seconds { get; set; }
		public weak uint ticks { get; set; }
		public signal bool time_error (Hildon.DateTimeError type);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class TimePicker : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public void get_time (uint hours, uint minutes);
		public TimePicker (Gtk.Window parent);
		public void set_time (uint hours, uint minutes);
		[NoAccessorMethod]
		public weak uint minutes { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class VVolumebar : Hildon.Volumebar, Atk.Implementor, Gtk.Buildable {
		public VVolumebar ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Volumebar : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public weak Gtk.Adjustment get_adjustment ();
		public double get_level ();
		public bool get_mute ();
		public void set_level (double level);
		public void set_mute (bool mute);
		public void set_range_insensitive_message (string message);
		public void set_range_insensitive_messagef (string format);
		[NoAccessorMethod]
		public weak bool can_focus { get; set construct; }
		[NoAccessorMethod]
		public weak bool has_mute { get; set construct; }
		public weak double level { get; set; }
		public weak bool mute { get; set; }
		public signal void level_changed ();
		public signal void mute_toggled ();
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class VolumebarRange : Gtk.Scale, Atk.Implementor, Gtk.Buildable {
		public double get_level ();
		public VolumebarRange (Gtk.Orientation orientation);
		public void set_level (double level);
		public weak double level { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class WeekdayPicker : Gtk.Container, Atk.Implementor, Gtk.Buildable {
		public bool isset_day (GLib.DateWeekday day);
		public WeekdayPicker ();
		public void set_all ();
		public void set_day (GLib.DateWeekday day);
		public void toggle_day (GLib.DateWeekday day);
		public void unset_all ();
		public void unset_day (GLib.DateWeekday day);
		public signal void selection_changed (int p0);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class Window : Gtk.Window, Atk.Implementor, Gtk.Buildable {
		public void add_toolbar (Gtk.Toolbar toolbar);
		public void add_with_scrollbar (Gtk.Widget child);
		public bool get_is_topmost ();
		public weak Gtk.Menu get_menu ();
		public Window ();
		public void remove_toolbar (Gtk.Toolbar toolbar);
		public void set_menu (Gtk.Menu menu);
		public weak bool is_topmost { get; }
		public signal void clipboard_operation (int operation);
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public class WizardDialog : Gtk.Dialog, Atk.Implementor, Gtk.Buildable {
		public WizardDialog (Gtk.Window parent, string wizard_name, Gtk.Notebook notebook);
		[NoAccessorMethod]
		public weak bool autotitle { get; set; }
		[NoAccessorMethod]
		public weak string wizard_name { get; set; }
		[NoAccessorMethod]
		public weak Gtk.Notebook wizard_notebook { get; set; }
	}
	[CCode (cheader_filename = "hildon/hildon.h")]
	public interface BreadCrumb : Gtk.Widget {
		public void activated ();
		public abstract void get_natural_size (int width, int height);
		public signal void crumb_activated ();
	}
	public const int MAJOR_VERSION;
	public const int MARGIN_DEFAULT;
	public const int MARGIN_DOUBLE;
	public const int MARGIN_HALF;
	public const int MARGIN_TRIPLE;
	public const int MICRO_VERSION;
	public const int MINOR_VERSION;
	public const int WINDOW_LONG_PRESS_TIME;
	public static int get_icon_pixel_size (Gtk.IconSize size);
	public static bool helper_event_button_is_finger (Gdk.EventButton event);
	public static void helper_set_insensitive_message (Gtk.Widget widget, string message);
	public static void helper_set_insensitive_messagef (Gtk.Widget widget, string format);
	public static ulong helper_set_logical_color (Gtk.Widget widget, Gtk.RcFlags rcflags, Gtk.StateType state, string logicalcolorname);
	public static ulong helper_set_logical_font (Gtk.Widget widget, string logicalfontname);
	public static void helper_set_thumb_scrollbar (Gtk.ScrolledWindow win, bool thumb);
	public static void play_system_sound (string sample);
}
