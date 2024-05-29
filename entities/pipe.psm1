Using module ./entities/renderizable.psm1


class Pipe : Renderizable {
  [Object]$app
  [double]$x
  [double]$y
  [double]$speed
  [double]$width
  [double]$height
  [double]$gapSize
  [double]$gapY
  [string]$orientation
  [string]$color

  Pipe ([double]$x, [string] $orientation, [double]$gapY, [Object] $app) {
    $this.app = $app
    $this.x = $x 
    $this.y = 0
    $this.speed = 1
    $this.gapSize = 0.2
    $this.gapY = $gapY
    $this.width = 3
    $this.height = 0
    $this.orientation = $orientation
    $this.color = "DarkGreen"
  }

  [void] setHeight(){
    $ceilHeight = ($this.app.winHeight * $this.gapY / 100) - ($this.app.winHeight * $this.gapSize * 0.5)
    if ($this.orientation -eq "ceil") {
      $this.height = $ceilHeight
    } else {
      $this.height = $this.app.winHeight - $ceilHeight - ($this.app.winHeight * $this.gapSize * 0.5)
    }
  }

  [void] setPosY(){
    if ($this.orientation -eq "ceil") {
      $this.y = 0
    } else {
      # $this.y = ($this.app.winHeight * $this.gapY / 100) + ($this.app.winHeight * $this.gapSize * 0.5)
      $this.y = 0
    }
  }

  [void] event(){}

  [void] update(){
    $this.x -= $this.speed
  }

  [void] render() {
    for ($i = $this.y; $i -lt $this.height; $i++) {
      [Console]::SetCursorPosition([int]$this.x, [int]$this.y + $i)
      Write-Host "   " -BackgroundColor $this.color
    }
  }
}

Export-ModuleMember -Function Pipe
