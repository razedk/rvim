local M = {}
local temp_session_file = nil

-- This function will toggle the current window to fullscreen and back.
-- It saves the entire window layout to a temporary file before making the window fullscreen.
-- When called again, it restores the layout from the file and then deletes the file.
function M.RzToggleFullscreen()
	-- Check if a temporary session file exists.
	-- This indicates we are in "fullscreen" mode and need to restore.
	if temp_session_file and vim.loop.fs_stat(temp_session_file) then
		-- Restore the session from the temporary file.
		-- We use `silent` to prevent any messages about the restoration.
		vim.cmd("silent! source " .. temp_session_file)

		-- Clean up the temporary session file.
		os.remove(temp_session_file)
		temp_session_file = nil
	else
		-- We are in a multi-window layout, so we need to save the session
		-- and then make the current window fullscreen.

		-- Get a unique name for our temporary session file.
		temp_session_file = vim.fn.tempname()

		-- Save the current session to the temporary file.
		-- The `!` forces a new session to be saved, overwriting any previous ones.
		vim.cmd("mksession! " .. temp_session_file)

		-- Close all other windows, leaving only the current one open.
		-- We iterate through all windows and close any that are not the current one.
		local current_win = vim.api.nvim_get_current_win()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if win ~= current_win then
				vim.api.nvim_win_close(win, true)
			end
		end
	end
end

return M
