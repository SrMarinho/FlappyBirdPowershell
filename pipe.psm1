class Pipe {
  [Object]$app
  [double]$x
  [double]$y
  [double]$speed
  [double]$width
  [double]$height
  [string]$orientation

  Pipe ([double] $height, [string] $orientation, [Object] $app) {
    $this.app = $app
    $this.x = $x 
    $this.y = $y
    $this.speed = $speed
    $this.width = 3
    $this.height = $height
    $this.orientation = $orientation
  }

  render() {
    for ($i = 0; $i -lt $this.width.Count; $i++) {
      for ($j = 0; $j -lt $this.width.Count; $j++) {
        if ($this.app.insideScreen($this.app.width, $this.app.height, $this.x + $i, $this.y)) {
            [Console]::SetCursorPosition($this.x + $i, $this.y)
            Write-Host ' ' -BackgroundColor $this.color
        }
      }
    }
  }

  pipeFloor () {
        
  }
}

Export-ModuleMember -Function Pipe 
