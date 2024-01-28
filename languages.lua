Languages   = { }
Language    = { }

function Languages.GetTranslation(str, ...)
	if not str then
		print(("[^1ERROR^7] Resource ^5%s^7 You did not specify a parameter for the Translate function or the value is nil!"):format(GetInvokingResource() or GetCurrentResourceName()))
		return 'Given translate function parameter is nil!'
	end

	if Language[Config.Language] then
		if Language[Config.Language][str] then
			return string.format(Language[Config.Language][str], ...)
		elseif Config.Language ~= 'en' and Language['en'] and Language['en'][str] then
			return string.format(Language['en'][str], ...)
		else
			return 'Translation [' .. Config.Language .. '][' .. str .. '] does not exist'
		end
	elseif Config.Language ~= 'en' and Language['en'] and Language['en'][str] then
		return string.format(Language['en'][str], ...)
	else
		return 'Language [' .. Config.Language .. '] does not exist'
	end
end