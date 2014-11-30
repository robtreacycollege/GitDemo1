require_relative 'total'
cc = Kangaroo.new(12,8)
tt = Die.new
cc.checkInitialEntry

while cc.runScripting == 0 do
  cc.hop(tt.throw)
  grid = Grid.new
  if(grid.lies_outside(cc.gridXX,cc.gridYY,cc.gridFinalXX,cc.gridFinalYY))
    point = Point.new()
    if(point.compare(cc.gridXX,cc.gridYY,cc.gridFinalXX,cc.gridFinalYY))
      print "final local cc.gridXX #{cc.gridXX} cc.gridFinalXX #{cc.gridFinalXX} cc.gridYY #{cc.gridYY} cc.gridFinalYY #{cc.gridFinalYY} \n"
      break
    else
    end
  else
    cc.resetGridPosition1
  end

  if cc.gridXX != cc.gridFinalXX
  elsif cc.gridYY != cc.gridFinalYY
  else
    cc.runScript(1)
  end

end
print"test"
print"test1"
tt.stats

