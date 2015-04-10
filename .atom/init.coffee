# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

path = require 'path'

atom.workspaceView.eachEditorView (editorView) ->
  editor = editorView.getEditor()

  # use hard tabs
  if path.basename(editor.getPath()) is 'Makefile'
    editor.setSoftTabs(false)
