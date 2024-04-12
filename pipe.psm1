class Pipe {
  [Object]$app
  [double]$x
  [double]$y
  [double]$speed
  [double]$height
  [string]$orientation

  Pipe ([double] $height, [string] $orientation, [Object] $app) {
    $this.app = $app
    $this.x = $x 
    $this.y = $y
    $this.speed = $speed
    $this.height = $height
    $this.orientation = $orientation
  }

  render() {
      if ($this.y -ge 0 -and $this.y -lt $this.app.winHeight) {
        if ($this.x -ge 0 -and $this.x -lt $this.app.winWidth) {
          [Console]::SetCursorPosition($this.x, $this.y)
          Write-Host '  ' -BackgroundColor $this.color
        }
      }
  }
}

Export-ModuleMember -Function Pipe 

