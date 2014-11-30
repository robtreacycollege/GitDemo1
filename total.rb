class Die
  def initialize()
    @random = 0
    @overallCount = 0
    @northCount = 0
    @southCount = 0
    @eastCount = 0
    @westCount = 0
  end

  def throw
    if(@initialChecker == 0)
      @initialChecker = 1
    end

    @random = 0
    @random = Random.rand(1...5)
    if (@random == 1)
      @northCount += 1
      @overallCount += 1
    elsif (@random == 3)
      @southCount += 1
      @overallCount += 1
    elsif (@random == 2)
      @eastCount += 1
      @overallCount += 1
    else
      @westCount += 1
      @overallCount += 1
    end

    return @random
  end

  def stats
    print "Total number of throws #{@overallCount} \n"
    print "Directional stats North  #{@northCount} South  #{@southCount}  East  #{@eastCount}  West  #{@westCount} \n"
    throwsPercentile
  end

  def throwsPercentile
    print"North as percentage of total count #{(@northCount.to_f / @overallCount.to_f * 100).round(2)} \n"
    print"South as percentage of total count #{(@southCount.to_f / @overallCount.to_f * 100).round(2)} \n"
    print"East as percentage of total count #{(@eastCount.to_f / @overallCount.to_f * 100).round(2)} \n"
    print"West as percentage of total count #{(@westCount.to_f / @overallCount.to_f * 100).round(2)} \n"
  end

end

class Grid
  def lies_outside(gridX,gridY,gridFinalX,gridFinalY)
    if gridX < 0 || gridY < 0
      return false
    end
    if gridX > gridFinalX || gridY > gridFinalY
      return false
    end
    return true
  end
end

class Point
  def compare(gridX,gridY,gridFinalX,gridFinalY)
    if gridX == gridFinalX && gridY == gridFinalY
      return true
    else
      return false
    end
  end
end


class Kangaroo
  def initialize(gridFinalX,gridFinalY)
    @gX = 0
    @gY = 0
    @gridX = 0
    @gridY = 0
    @gridFinalX = gridFinalX
    @gridFinalY = gridFinalY
    @initialChecker = 0
    @runScript = 0
  end

  def hop(direction)
    #checkInitialEntry
    if(direction == 1 || direction == 2)
       if(direction == 1)
         @gridY += 1
       else
         @gridY -= 1
       end
     else
       if(direction == 3)
         @gridX += 1
       else
         @gridX -= 1
       end
    end
  end

  def resetGridPosition
    if @gridX < 0 || @gridY < 0
      if @gridX < 0
        @gridX = 0
      else
        @gridY = 0
      end
    else
      if @gridX > @gridFinalX
        @gridX = @gridFinalX
      else
        @gridY = @gridFinalY
      end
    end
  end

  def resetGridPosition1
    if @gridX < 0 || @gridY < 0
      if @gridX < 0
        gridX(0)
      else
        gridY(0)
      end
    else
      if @gridX > @gridFinalX
        gridX(@gridFinalX)
      else
        gridY(@gridFinalY)
      end
    end
  end

  def getGridValues
    print "Die @gridX after #{@gridX} \n"
    print "Die @gridY after #{@gridY} \n"
  end

  def at_home
    if @gridX == @gridFinalX && @gridY == @gridFinalY
      return true
    else
      return false
    end
  end

  def at_home_check()
    if(at_home)
      print "you are home \n"
    else
      print "on the road again \n"
    end
  end


  def checkInitialEntry
    if(@gridFinalX < 0 || @gridFinalY < 0)
      print "value entered is negative \n"
      if @gridFinalX < 0
        gridFinalX(0)
      else
        gridFinalY(0)
      end
    end
  end

  def gridFinalXX
    @gridFinalX
  end

  def gridFinalYY
    @gridFinalY
  end

  def gridFinalX(gridFinalX)
    @gridFinalX = gridFinalX
  end

  def gridFinalY(gridFinalY)
    @gridFinalY = gridFinalY
  end

  def gridXX
    @gridX
  end

  def gridYY
    @gridY
  end

  def gridX(gridX)
    @gridX = gridX
  end

  def gridY(gridY)
    @gridY = gridY
  end

  def runScripting
    @runScript
  end

  def runScript(runScript)
    @runScript = runScript
  end
end
