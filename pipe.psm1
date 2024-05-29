class Pipe {
  [Object]$app
  [double]$x
  [double]$y
  [double]$gapY
  [double]$gapSize
  [double]$speed
  [double]$width
  [double]$height
  [string]$orientation
  [string]$color

  Pipe ([double] $x, [double] $gapY, [string] $orientation, [Object] $app) {
    $this.app = $app
    $this.x = $x 
    $this.y = 0
    $this.gapY = $gapY
    $this.gapSize = 0.1
    $this.speed = 1
    $this.width = 3
    $this.orientation = $orientation
    $this.color = "DarkGreen"
    $this.height = 0
    $this.setHeight($this.gapY)
    $this.setPosY($this.gapY)
  }

  [void] setHeight([double] $gapY) {
    $gap = $this.app.winHeight * ($this.gapSize * 0.5)
    $ceilHeight = $gapY - $gap
    if ($this.orientation -eq 'ceil') {
      $this.height = $ceilHeight
      return
    }
    $this.height = $this.app.winHeight - $ceilHeight - $gap - 1
  }

  [void] setPosY([double] $gapY) {
    $gap = $this.app.winHeight * ($this.gapSize * 0.5)
    $ceilHeight = $gapY - $gap
    if ($this.orientation -eq 'ceil') {
      $this.y = 0
      return
    }
    $this.y = $ceilHeight + $gap  - 1
  }
  
  [void] event() {}

  [void] update() {
      $this.x -= $this.speed
  }

  [void] render() {
    for ($i = $this.y; $i -lt $this.height; $i++) {
        [Console]::SetCursorPosition($this.x, $this.y + $i)
        Write-Host '   ' -BackgroundColor $this.color
    }
  }

}

Export-ModuleMember -Function Pipe 
