if !exists('g:vlime_default_mappings')
    let s:vlime_leader = get(g:, 'vlime_leader', '')
    if len(s:vlime_leader) <= 0
        let s:vlime_leader = '<LocalLeader>'
    endif

    " buf_type: [
    "   [mode, key, command, description],
    "   ...
    " ]
    let g:vlime_default_mappings = {
                \ 'lisp': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("lisp")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['i', '<space>', '<space><c-r>=vlime#plugin#VlimeKey("space")<cr>',
                        \ 'Trigger the arglist hint.'],
                    \ ['i', '<cr>', '<cr><c-r>=vlime#plugin#VlimeKey("cr")<cr>',
                        \ 'Trigger the arglist hint.'],
                    \ ['i', '<tab>', '<c-r>=vlime#plugin#VlimeKey("tab")<cr>',
                        \ 'Trigger omni-completion.'],
                    \
                    \ ['n', s:vlime_leader.'cc', ':call vlime#plugin#ConnectREPL()<cr>',
                        \ 'Connect to a server.'],
                    \ ['n', s:vlime_leader.'cs', ':call vlime#plugin#SelectCurConnection()<cr>',
                        \ 'Switch connections.'],
                    \ ['n', s:vlime_leader.'cd', ':call vlime#plugin#CloseCurConnection()<cr>',
                        \ 'Disconnect.'],
                    \ ['n', s:vlime_leader.'cR', ':call vlime#plugin#RenameCurConnection()<cr>',
                        \ 'Rename the current connection.'],
                    \
                    \ ['n', s:vlime_leader.'rr', ':call vlime#server#New(v:true, get(g:, "vlime_cl_use_terminal", v:false))<cr>',
                        \ 'Run a new server and connect to it.'],
                    \ ['n', s:vlime_leader.'rv', ':call vlime#plugin#ShowSelectedServer()<cr>',
                        \ 'View the console output of a server.'],
                    \ ['n', s:vlime_leader.'rs', ':call vlime#plugin#StopSelectedServer()<cr>',
                        \ 'Stop a server.'],
                    \ ['n', s:vlime_leader.'rR', ':call vlime#plugin#RenameSelectedServer()<cr>',
                        \ 'Rename a server.'],
                    \
                    \ ['n', s:vlime_leader.'ss', ':call vlime#plugin#SendToREPL(vlime#ui#CurExprOrAtom())<cr>',
                        \ 'Send the expression/atom under the cursor to the REPL.'],
                    \ ['n', s:vlime_leader.'se', ':call vlime#plugin#SendToREPL(vlime#ui#CurExpr())<cr>',
                        \ 'Send the expression under the cursor to the REPL.'],
                    \ ['n', s:vlime_leader.'st', ':call vlime#plugin#SendToREPL(vlime#ui#CurTopExpr())<cr>',
                        \ 'Send the top-level expression under the cursor to the REPL.'],
                    \ ['n', s:vlime_leader.'sa', ':call vlime#plugin#SendToREPL(vlime#ui#CurAtom())<cr>',
                        \ 'Send the atom under the cursor to the REPL.'],
                    \ ['n', s:vlime_leader.'si', ':call vlime#plugin#SendToREPL()<cr>',
                        \ 'Send a snippet to the REPL.'],
                    \ ['v', s:vlime_leader.'s', ':<c-u>call vlime#plugin#SendToREPL(vlime#ui#CurSelection())<cr>',
                        \ 'Send the current selection to the REPL.'],
                    \
                    \ ['n', s:vlime_leader.'mm', ':call vlime#plugin#ExpandMacro(vlime#ui#CurExpr(), "expand")<cr>',
                        \ 'Expand the macro under the cursor.'],
                    \ ['n', s:vlime_leader.'m1', ':call vlime#plugin#ExpandMacro(vlime#ui#CurExpr(), "one")<cr>',
                        \ 'Expand the macro under the cursor once.'],
                    \ ['n', s:vlime_leader.'ma', ':call vlime#plugin#ExpandMacro(vlime#ui#CurExpr(), "all")<cr>',
                        \ 'Expand the macro under the cursor and all nested macros.'],
                    \
                    \ ['n', s:vlime_leader.'oe', ':call vlime#plugin#Compile(vlime#ui#CurExpr(v:true))<cr>',
                        \ 'Compile the expression under the cursor.'],
                    \ ['n', s:vlime_leader.'ot', ':call vlime#plugin#Compile(vlime#ui#CurTopExpr(v:true))<cr>',
                        \ 'Compile the top-level expression under the cursor.'],
                    \ ['n', s:vlime_leader.'of', ':call vlime#plugin#CompileFile(expand("%:p"))<cr>',
                        \ 'Compile the current file.'],
                    \ ['v', s:vlime_leader.'o', ':<c-u>call vlime#plugin#Compile(vlime#ui#CurSelection(v:true))<cr>',
                        \ 'Compile the current selection.'],
                    \
                    \ ['n', s:vlime_leader.'xc', ':call vlime#plugin#XRefSymbol("CALLS", vlime#ui#CurAtom())<cr>',
                        \ 'Show callers of the function under the cursor.'],
                    \ ['n', s:vlime_leader.'xC', ':call vlime#plugin#XRefSymbol("CALLS-WHO", vlime#ui#CurAtom())<cr>',
                        \ 'Show callees of the function under the cursor.'],
                    \ ['n', s:vlime_leader.'xr', ':call vlime#plugin#XRefSymbol("REFERENCES", vlime#ui#CurAtom())<cr>',
                        \ 'Show references to the variable under the cursor.'],
                    \ ['n', s:vlime_leader.'xb', ':call vlime#plugin#XRefSymbol("BINDS", vlime#ui#CurAtom())<cr>',
                        \ 'Show bindings for the variable under the cursor.'],
                    \ ['n', s:vlime_leader.'xs', ':call vlime#plugin#XRefSymbol("SETS", vlime#ui#CurAtom())<cr>',
                        \ 'Show locations where the variable under the cursor is set.'],
                    \ ['n', s:vlime_leader.'xe', ':call vlime#plugin#XRefSymbol("MACROEXPANDS", vlime#ui#CurAtom())<cr>',
                        \ 'Show locations where the macro under the cursor is called.'],
                    \ ['n', s:vlime_leader.'xm', ':call vlime#plugin#XRefSymbol("SPECIALIZES", vlime#ui#CurAtom())<cr>',
                        \ 'Show specialized methods for the class under the cursor.'],
                    \ ['n', s:vlime_leader.'xd', ':call vlime#plugin#FindDefinition(vlime#ui#CurAtom())<cr>',
                        \ 'Show the definition for the name under the cursor.'],
                    \ ['n', s:vlime_leader.'xi', ':<c-u>call vlime#plugin#XRefSymbolWrapper()<cr>',
                        \ 'Interactively prompt for the symbol to search for cross references.'],
                    \
                    \ ['n', s:vlime_leader.'do', ':call vlime#plugin#DescribeSymbol(vlime#ui#CurOperator())<cr>',
                        \ 'Describe the operator of the expression under the cursor.'],
                    \ ['n', s:vlime_leader.'da', ':call vlime#plugin#DescribeSymbol(vlime#ui#CurAtom())<cr>',
                        \ 'Describe the atom under the cursor.'],
                    \ ['n', s:vlime_leader.'di', ':call vlime#plugin#DescribeSymbol()<cr>',
                        \ 'Prompt for the symbol to describe.'],
                    \ ['n', s:vlime_leader.'ds', ':call vlime#plugin#AproposList()<cr>',
                        \ 'Apropos search.'],
                    \ ['n', s:vlime_leader.'ddo', ':call vlime#plugin#DocumentationSymbol(vlime#ui#CurOperator())<cr>',
                        \ 'Show the documentation for the operator of the expression under the cursor.'],
                    \ ['n', s:vlime_leader.'dda', ':call vlime#plugin#DocumentationSymbol(vlime#ui#CurAtom())<cr>',
                        \ 'Show the documentation for the atom under the cursor.'],
                    \ ['n', s:vlime_leader.'ddi', ':call vlime#plugin#DocumentationSymbol()<cr>',
                        \ 'Prompt for a symbol, and show its documentation.'],
                    \ ['n', s:vlime_leader.'dr', ':call vlime#plugin#ShowOperatorArgList(vlime#ui#CurOperator())<cr>',
                        \ 'Show the arglist for the expresison under the cursor.'],
                    \
                    \ ['n', [s:vlime_leader.'II', s:vlime_leader.'Ii'], ':call vlime#plugin#Inspect(vlime#ui#CurExprOrAtom())<cr>',
                        \ 'Evaluate the expression/atom under the cursor, and inspect the result.'],
                    \ ['n', [s:vlime_leader.'IE', s:vlime_leader.'Ie'], ':call vlime#plugin#Inspect(vlime#ui#CurExpr())<cr>',
                        \ 'Evaluate the expression under the cursor, and inspect the result.'],
                    \ ['n', [s:vlime_leader.'IT', s:vlime_leader.'It'], ':call vlime#plugin#Inspect(vlime#ui#CurTopExpr())<cr>',
                        \ 'Evaluate the top-level expression under the cursor, and inspect the result.'],
                    \ ['n', [s:vlime_leader.'IA', s:vlime_leader.'Ia'], ':call vlime#plugin#Inspect(vlime#ui#CurAtom())<cr>',
                        \ 'Evaluate the atom under the cursor, and inspect the result.'],
                    \ ['n', [s:vlime_leader.'IN', s:vlime_leader.'In'], ':call vlime#plugin#Inspect()<cr>',
                        \ 'Evaluate a snippet, and inspect the result.'],
                    \ ['v', s:vlime_leader.'I', ':<c-u>call vlime#plugin#Inspect(vlime#ui#CurSelection())<cr>',
                        \ 'Evaluate the current selection, and inspect the result.'],
                    \
                    \ ['n', [s:vlime_leader.'TD', s:vlime_leader.'Td'], ':call vlime#plugin#OpenTraceDialog()<cr>',
                        \ 'Show the trace dialog.'],
                    \ ['n', [s:vlime_leader.'TI', s:vlime_leader.'Ti'], ':call vlime#plugin#DialogToggleTrace()<cr>',
                        \ 'Prompt for a function name to trace/untrace.'],
                    \ ['n', [s:vlime_leader.'TT', s:vlime_leader.'Tt'], ':call vlime#plugin#DialogToggleTrace(vlime#ui#CurAtom())<cr>',
                        \ 'Trace/untrace the function under the cursor.'],
                    \
                    \ ['n', s:vlime_leader.'uf', ':call vlime#plugin#UndefineFunction(vlime#ui#CurAtom())<cr>',
                        \ 'Undefine the function under the cursor.'],
                    \ ['n', s:vlime_leader.'us', ':call vlime#plugin#UninternSymbol(vlime#ui#CurAtom())<cr>',
                        \ 'Unintern the symbol under the cursor.'],
                    \ ['n', s:vlime_leader.'ui', ':<c-u>call vlime#plugin#UndefineUninternWrapper()<cr>',
                        \ 'Interactively prompt for the function/symbol to undefine/unintern.'],
                    \
                    \ ['n', s:vlime_leader.'wp', ':call vlime#plugin#CloseWindow("preview")<cr>',
                        \ 'Close all visible preview windows.'],
                    \ ['n', s:vlime_leader.'wr', ':call vlime#plugin#CloseWindow("arglist")<cr>',
                        \ 'Close all visible arglist windows.'],
                    \ ['n', s:vlime_leader.'wn', ':call vlime#plugin#CloseWindow("notes")<cr>',
                        \ 'Close all visible compiler notes windows.'],
                    \ ['n', s:vlime_leader.'wR', ':call vlime#plugin#CloseWindow("repl")<cr>',
                        \ 'Close all visible REPL windows.'],
                    \ ['n', s:vlime_leader.'wA', ':call vlime#plugin#CloseWindow("")<cr>',
                        \ 'Close all Vlime windows.'],
                    \ ['n', s:vlime_leader.'wl', ':call vlime#plugin#CloseWindow()<cr>',
                        \ 'Show a list of visible Vlime windows, and choose which to close.'],
                    \
                    \ ['n', s:vlime_leader.'i', ':call vlime#plugin#InteractionMode()<cr>',
                        \ 'Interaction mode.'],
                    \ ['n', s:vlime_leader.'l', ':call vlime#plugin#LoadFile(expand("%:p"))<cr>',
                        \ 'Load the current file.'],
                    \ ['n', s:vlime_leader.'a', ':call vlime#plugin#DisassembleForm(vlime#ui#CurExpr())<cr>',
                        \ 'Disassemble the form under the cursor.'],
                    \ ['n', s:vlime_leader.'p', ':call vlime#plugin#SetPackage()<cr>',
                        \ 'Specify the package for the current buffer.'],
                    \ ['n', s:vlime_leader.'b', ':call vlime#plugin#SetBreakpoint()<cr>',
                        \ 'Set a breakpoint at entry to a function.'],
                    \ ['n', s:vlime_leader.'t', ':call vlime#plugin#ListThreads()<cr>',
                        \ 'Show a list of the running threads.'],
                \ ],
                \
                \ 'sldb': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("sldb")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', '<cr>', ':call vlime#ui#sldb#ChooseCurRestart()<cr>',
                        \ 'Choose a restart.'],
                    \ ['n', 'd', ':call vlime#ui#sldb#ShowFrameDetails()<cr>',
                        \ 'Show the details of the frame under the cursor.'],
                    \ ['n', 'S', ':<c-u>call vlime#ui#sldb#OpenFrameSource()<cr>',
                        \ 'Open the source code for the frame under the cursor.'],
                    \ ['n', 'T', ':<c-u>call vlime#ui#sldb#OpenFrameSource("tabedit")<cr>',
                        \ 'Open the source code for the frame under the cursor, in a separate tab.'],
                    \ ['n', 'O', ':<c-u>call vlime#ui#sldb#FindSource()<cr>',
                        \ 'Open the source code for a local variable.'],
                    \ ['n', 'r', ':call vlime#ui#sldb#RestartCurFrame()<cr>',
                        \ 'Restart the frame under the cursor.'],
                    \ ['n', 's', ':call vlime#ui#sldb#StepCurOrLastFrame("step")<cr>',
                        \ 'Start stepping in the frame under the cursor.'],
                    \ ['n', 'x', ':call vlime#ui#sldb#StepCurOrLastFrame("next")<cr>',
                        \ 'Step over the current function call.'],
                    \ ['n', 'o', ':call vlime#ui#sldb#StepCurOrLastFrame("out")<cr>',
                        \ 'Step out of the current function.'],
                    \ ['n', 'c', ':call b:vlime_conn.SLDBContinue()<cr>',
                        \ 'Invoke the restart labeled CONTINUE.'],
                    \ ['n', 'a', ':call b:vlime_conn.SLDBAbort()<cr>',
                        \ 'Invoke the restart labeled ABORT.'],
                    \ ['n', 'C', ':call vlime#ui#sldb#InspectCurCondition()<cr>',
                        \ 'Inspect the current condition object.'],
                    \ ['n', 'i', ':call vlime#ui#sldb#InspectInCurFrame()<cr>',
                        \ 'Evaluate and inspect an expression in the frame under the cursor.'],
                    \ ['n', 'e', ':call vlime#ui#sldb#EvalStringInCurFrame()<cr>',
                        \ 'Evaluate an expression in the frame under the cursor.'],
                    \ ['n', 'E', ':call vlime#ui#sldb#SendValueInCurFrameToREPL()<cr>',
                        \ 'Evaluate an expression in the frame under the cursor, and send the result to the REPL.'],
                    \ ['n', 'D', ':call vlime#ui#sldb#DisassembleCurFrame()<cr>',
                        \ 'Disassemble the frame under the cursor.'],
                    \ ['n', 'R', ':call vlime#ui#sldb#ReturnFromCurFrame()<cr>',
                        \ 'Return a manually specified result from the frame under the cursor.'],
                \ ],
                \
                \ 'repl': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("repl")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', '<c-c>', ':call b:vlime_conn.Interrupt({"name": "REPL-THREAD", "package": "KEYWORD"})<cr>',
                        \ 'Interrupt the REPL thread.'],
                    \ ['n', s:vlime_leader.'I', ':call vlime#ui#repl#InspectCurREPLPresentation()<cr>',
                        \ 'Inspect the evaluation result under the cursor.'],
                    \ ['n', s:vlime_leader.'y', ':call vlime#ui#repl#YankCurREPLPresentation()<cr>',
                        \ 'Yank the evaluation result under the cursor.'],
                    \ ['n', s:vlime_leader.'C', ':call vlime#ui#repl#ClearREPLBuffer()<cr>',
                        \ 'Clear the REPL buffer.'],
                    \ ['n', ['<tab>', '<c-n>'], ':call vlime#ui#repl#NextField(v:true)<cr>',
                        \ 'Move the cursor to the next presented object.'],
                    \ ['n', '<c-p>', ':call vlime#ui#repl#NextField(v:false)<cr>',
                        \ 'Move the cursor to the previous presented object.'],
                \ ],
                \
                \ 'mrepl': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("mrepl")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['i', '<space>', '<space><c-r>=vlime#plugin#VlimeKey("space")<cr>',
                        \ 'Trigger the arglist hint.'],
                    \ ['i', '<cr>', '<c-r>=vlime#ui#mrepl#Submit()<cr>',
                        \ 'Submit the last input to the REPL.'],
                    \ ['i', '<c-j>', '<cr><c-r>=vlime#plugin#VlimeKey("cr")<cr>',
                        \ 'Insert a newline, and trigger the arglist hint.'],
                    \ ['i', '<tab>', '<c-r>=vlime#plugin#VlimeKey("tab")<cr>',
                        \ 'Trigger omni-completion.'],
                    \ ['i', '<c-c>', '<c-r>=vlime#ui#mrepl#Interrupt()<cr>',
                        \ 'Interrupt the MREPL thread.'],
                    \ ['n', s:vlime_leader.'C', ':call vlime#ui#mrepl#Clear()<cr>',
                        \ 'Clear the MREPL buffer.'],
                    \ ['n', s:vlime_leader.'D', ':call vlime#ui#mrepl#Disconnect()<cr>',
                        \ 'Disconnect from this REPL.'],
                \ ],
                \
                \ 'inspector': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("inspector")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', ['<cr>', '<space>'], ':call vlime#ui#inspector#InspectorSelect()<cr>',
                        \ 'Activate the interactable field/button under the cursor.'],
                    \ ['n', 's', ':call vlime#ui#inspector#SendCurValueToREPL()<cr>',
                        \ 'Send the value of the field under the cursor, to the REPL.'],
                    \ ['n', 'S', ':call vlime#ui#inspector#SendCurInspecteeToREPL()<cr>',
                        \ 'Send the value being inspected to the REPL.'],
                    \ ['n', 'o', ':<c-u>call vlime#ui#inspector#FindSource("part")<cr>',
                        \ 'Open the source code for the value of the field under the cursor.'],
                    \ ['n', 'O', ':<c-u>call vlime#ui#inspector#FindSource("inspectee")<cr>',
                        \ 'Open the source code for the value being inspected.'],
                    \ ['n', ['<tab>', '<c-n>'], ':call vlime#ui#inspector#NextField(v:true)<cr>',
                        \ 'Select the next interactable field/button.'],
                    \ ['n', '<c-p>', ':call vlime#ui#inspector#NextField(v:false)<cr>',
                        \ 'Select the previous interactable field/button.'],
                    \ ['n', 'p', ':call vlime#ui#inspector#InspectorPop()<cr>',
                        \ 'Return to the previous inspected object.'],
                    \ ['n', 'P', ':call vlime#ui#inspector#InspectorNext()<cr>',
                        \ 'Move to the next inspected object.'],
                    \ ['n', 'R', ':call b:vlime_conn.InspectorReinspect({c, r -> c.ui.OnInspect(c, r, v:null, v:null)})<cr>',
                        \ 'Refresh the inspector.'],
                \ ],
                \
                \ 'trace': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("trace")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', ['<cr>', '<space>'], ':call vlime#ui#trace_dialog#Select()<cr>',
                        \ 'Activate the interactable field/button under the cursor.'],
                    \ ['n', 'i', ':call vlime#ui#trace_dialog#Select("inspect")<cr>',
                        \ 'Inspect the value of the field under the cursor.'],
                    \ ['n', 's', ':call vlime#ui#trace_dialog#Select("to_repl")<cr>',
                        \ 'Send the value of the field under the cursor to the REPL.'],
                    \ ['n', 'R', ':call vlime#plugin#OpenTraceDialog()<cr>',
                        \ 'Refresh the trace dialog.'],
                    \ ['n', ['<tab>', '<c-n>'], ':call vlime#ui#trace_dialog#NextField(v:true)<cr>',
                        \ 'Select the next interactable field/button.'],
                    \ ['n', '<c-p>', ':call vlime#ui#trace_dialog#NextField(v:false)<cr>',
                        \ 'Select the previous interactable field/button.'],
                \ ],
                \
                \ 'xref': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("xref")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', '<cr>', ':<c-u>call vlime#ui#xref#OpenCurXref()<cr>',
                        \ 'Open the selected source location.'],
                    \ ['n', 't', ':<c-u>call vlime#ui#xref#OpenCurXref(v:true, "tabedit")<cr>',
                        \ 'Open the selected source location, in a separate tab.'],
                    \ ['n', 's', ':<c-u>call vlime#ui#xref#OpenCurXref(v:true, "split")<cr>',
                        \ 'Open the selected source location, in a horizontal split window.'],
                    \ ['n', 'S', ':<c-u>call vlime#ui#xref#OpenCurXref(v:true, "vsplit")<cr>',
                        \ 'Open the selected source location, in a vertical split window.'],
                \ ],
                \
                \ 'notes': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("notes")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', '<cr>', ':<c-u>call vlime#ui#compiler_notes#OpenCurNote()<cr>',
                        \ 'Open the selected source location.'],
                    \ ['n', 't', ':<c-u>call vlime#ui#compiler_notes#OpenCurNote("tabedit")<cr>',
                        \ 'Open the selected source location, in a separate tab.'],
                    \ ['n', 's', ':<c-u>call vlime#ui#compiler_notes#OpenCurNote("split")<cr>',
                        \ 'Open the selected source location, in a horizontal split window.'],
                    \ ['n', 'S', ':<c-u>call vlime#ui#compiler_notes#OpenCurNote("vsplit")<cr>',
                        \ 'Open the selected source location, in a vertical split window.'],
                \ ],
                \
                \ 'threads': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("threads")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', '<c-c>', ':call vlime#ui#threads#InterruptCurThread()<cr>',
                        \ 'Interrupt the selected thread.'],
                    \ ['n', 'K', ':call vlime#ui#threads#KillCurThread()<cr>',
                        \ 'Kill the selected thread.'],
                    \ ['n', 'D', ':call vlime#ui#threads#DebugCurThread()<cr>',
                        \ 'Invoke the debugger in the selected thread.'],
                    \ ['n', 'r', ':call vlime#ui#threads#Refresh()<cr>',
                        \ 'Refresh the thread list.'],
                \ ],
                \
                \ 'server': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("server")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', s:vlime_leader.'c', ':call vlime#server#ConnectToCurServer()<cr>',
                        \ 'Connect to this server.'],
                    \ ['n', s:vlime_leader.'s', ':call vlime#server#StopCurServer()<cr>',
                        \ 'Stop this server.'],
                \ ],
                \
                \ 'input': [
                    \ ['n', s:vlime_leader.'?', ':call vlime#ui#ShowQuickRef("input")<cr>',
                        \ 'Show this quick reference.'],
                    \
                    \ ['n', '<c-p>', ':call vlime#ui#input#NextHistoryItem("backward")<cr>',
                        \ 'Show the previous item in input history.'],
                    \ ['n', '<c-n>', ':call vlime#ui#input#NextHistoryItem("forward")<cr>',
                        \ 'Show the next item in input history.'],
                \ ],
            \ }
endif


function! vlime#ui#mapping#GetBufferMappings(buf_type)
    return g:vlime_default_mappings[a:buf_type]
endfunction
