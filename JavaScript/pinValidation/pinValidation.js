// ATMs allow 4 or 6 digit PIN codes, and PIN codes cannot contain anything but exactly 4 or exactly 6 digits.

// If the function is passed a valid PIN string, return true, else return false.

function validatePIN (pin) {
  return ( /^([0-9])*$/gm.test(pin) && /^\S+$/.test(pin) && (pin.length === 4 || pin.length === 6) )
}
