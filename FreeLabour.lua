-- ============================================================= --
-- FREE LABOUR MOD
-- ============================================================= --

FreeLabour = {}

addModEventListener(FreeLabour)

function FreeLabour:getPricePerMs(superFunc)
	--print("Free Labour!")
	superFunc(self)
    return 0
end

function FreeLabour:loadMap(name)
	--print("Loaded Mod: 'FREE LABOUR'")
	
	AIJob.getPricePerMs = Utils.overwrittenFunction(AIJob.getPricePerMs, FreeLabour.getPricePerMs)
	AIJobConveyor.getPricePerMs = Utils.overwrittenFunction(AIJobConveyor.getPricePerMs, FreeLabour.getPricePerMs)
	AIJobFieldWork.getPricePerMs = Utils.overwrittenFunction(AIJobFieldWork.getPricePerMs, FreeLabour.getPricePerMs)
	
	self.initialised = false
end

function FreeLabour:deleteMap()
end

function FreeLabour:mouseEvent(posX, posY, isDown, isUp, button)
end

function FreeLabour:keyEvent(unicode, sym, modifier, isDown)
end

function FreeLabour:draw()
end

function FreeLabour:update(dt)
	if self.initialised ~= nil then
		if not self.initialised then
			print("***FreeLabour is loaded***")
			self.initialised = true
		end
	else
		print("***FreeLabour could not overwrite functions***")
		self.initialised = true
	end
end
