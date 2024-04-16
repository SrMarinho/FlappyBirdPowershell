Using module ./scene.psm1


class GameEngine {
  [int]$winWidth
  [int]$winHeight
  [bool]$running
  [double]$fps
  [double]$frames_interval
  [Scene]$scene
  [double]$gravity

  GameEngine ([int]$width, [int]$height) {
    $this.winWidth = $width
    $this.winHeight = $height
    $this.running = $true
    $this.fps = 60
    $this.frames_interval = 1000 / $this.fps
    $this.scene = [Scene]::new($this)
    $this.gravity = 0.3
  }

  event () {
    $this.scene.event()
  }

  update () {
    $this.scene.update()
  }

  render () {
    $this.scene.render()
  }

  run () { 
    while ($this.running) {
      Clear-Host
      $this.event()
      $this.update()
      $this.render()
      Start-Sleep -Milliseconds $this.frames_interval
    }
  }

  [bool] insideScreen([int]$screenWidth, [int]$screenHeight, [double]$x, [double]$y) {
    if ($y -ge 0 -and $y -lt $screenHeight) {
      if ($x -ge 0 -and $x -lt $screenWidth) {
        return $true
      }
    }
    return $false
  }
}

Export-ModuleMember -Function GameEngine 
