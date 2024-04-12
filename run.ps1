Using module ./scene.psm1


# [Console]::BackgroundColor = "DarkCyan"
Clear-Host

[Console]::CursorVisible = $false

$windowWidth = $Host.UI.RawUI.WindowSize.Width
$windowHeight = $Host.UI.RawUI.WindowSize.Height

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
}

# Exemplo de uso
$gameEngine = [GameEngine]::new($windowWidth, $windowHeight)
$gameEngine.run()
