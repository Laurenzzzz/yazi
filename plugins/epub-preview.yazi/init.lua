local M = {}

function M:peek()
	local cache = ya.file_cache(self)
	if not cache then
		return
	end

	if self:preload() == 1 then
		ya.image_show(cache, self.area)
		ya.preview_widgets(self, {})
	end
end

function M:seek(units) end

function M:preload()
	local cache = ya.file_cache(self)
	if not cache or fs.cha(cache) then
		return 1
	end

	local child, code = Command("ebook-meta"):args({
		"--get-cover=" .. tostring(cache),
		tostring(self.file.url),
	}):spawn()

	if not child then
		ya.err("spawn `ebook-meta` command returns " .. tostring(code))
		return 0
	end

	local status = child:wait()
	return status and status.success and 1 or 2
end

return M
