--- assorted definitions and daffynitions common to most of my projects
--- set 1
-- michel@wolfstar.ca

system.print("ws2_common_lib: ... loading1 ... ")

PrecisionDigits      = 2
PrecisionValue       = 10 ^ PrecisionDigits
GramsToKG            = 1000
Minutes              = {}
Minutes[1]           = 60
Minutes[2]           = Minutes[1] * 2
Minutes[5]           = Minutes[1] * 5

ScreenPulseTable     = {}
ScreenPulseTable[1]  = "[-=+     ]"
ScreenPulseTable[2]  = "[ -=+    ]"
ScreenPulseTable[3]  = "[  -=+   ]"
ScreenPulseTable[4]  = "[   -=+  ]"
ScreenPulseTable[5]  = "[    -=+ ]"
ScreenPulseTable[6]  = "[     -=+]"
ScreenPulseTable[7]  = "[     -+=]"
ScreenPulseTable[8]  = "[     +=-]"
ScreenPulseTable[9]  = "[    +=- ]"
ScreenPulseTable[10] = "[   +=-  ]"
ScreenPulseTable[11] = "[  +=-   ]"
ScreenPulseTable[12] = "[ +=-    ]"
ScreenPulseTable[13] = "[+=-     ]"
ScreenPulseTable[14] = "[=+-     ]"
ScreenPulseTable[15] = "[=-+     ]"
AnimationPulseIndex  = 1

function roundUpToPrecision(valueToRound)
  if valueToRound == nil then return 0 end
  local roundedValue = (math.ceil(valueToRound * precisionValue) / precisionValue)
  return roundedValue
end

---
function roundDownToPrecision(valueToRound)
  if valueToRound == nil then return 0 end
  local roundedValue = (math.floor(valueToRound * precisionValue) / precisionValue)
  return roundedValue
end

---
function roundOff(valueToRound)
  if valueToRound == nil then return 0 end
  local roundedValue = math.floor(roundUpToPrecision(valueToRound))
  return roundedValue
end

---
function screenPulseTick()
  animationPulseIndex = animationPulseIndex + 1
  if animationPulseIndex > #screenPulseTable then animationPulseIndex = 1 end
  return screenPulseTable[animationPulseIndex]
end

---
function containerLoadData(input_percent)
  mt          = "_"
  lo          = "-"
  med         = "+"
  hi          = "="

  maxBarWidth = 10
  fill_bar    = ""
  barEmpty    = math.ceil(maxBarWidth * (1 - input_percent))
  barFilled   = maxBarWidth - barEmpty

  fillCap     = 3
  if fillCap > barFilled then fillCap = barFilled end
  for i = 1, fillCap, 1
  do
    fill_bar = fill_bar .. lo
    barFilled = barFilled - 1
  end

  fillCap = 3
  if fillCap > barFilled then fillCap = barFilled end
  for i = 1, fillCap, 1
  do
    fill_bar = fill_bar .. med
    barFilled = barFilled - 1
  end

  fillCap = 3
  if fillCap > barFilled then fillCap = barFilled end
  for i = 1, fillCap, 1
  do
    fill_bar = fill_bar .. hi
    barFilled = barFilled - 1
  end

  for i = 1, barEmpty, 1
  do
    fill_bar = fill_bar .. mt
  end

  return fill_bar
end

---
system.print("ws2_common_lib: ... ready1 ... ")
--- eof
