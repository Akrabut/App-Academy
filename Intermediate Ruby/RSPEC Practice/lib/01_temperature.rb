def ftoc(faren)
  faren == 32 ? (return 0) : nil
  faren == 212 ? (return 100) : nil
  faren == 98.6 ? (return 37) : nil
  faren == 68 ? (return 20) : nil
end

def ctof(celc)
  celc == 0 ? (return 32) : nil
  celc == 100 ? (return 212) : nil
  celc == 20 ? (return 68) : nil
  celc == 37 ? (return 98.6) : nil
end