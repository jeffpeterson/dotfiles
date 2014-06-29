import sublime, sublime_plugin

class ScopeToClipboardCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		sublime.set_clipboard(self.view.syntax_name(self.view.sel()[0].b))
