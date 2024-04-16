class Bird {
    [Object] $app
    [double] $x
    [double] $y
    [string] $color
    [double] $speed
    [double] $speedLimit
    [double] $jumpForce

    Bird ($x, $y, $app) {
        $this.app = $app
        $this.x = $x
        $this.y = $y
        $this.color = "DarkYellow"
        $this.speed = 0
        $this.speedLimit = 2
        $this.jumpForce = 5
    }
    
    event () {
      if ([console]::KeyAvailable)
      {
          $keyPressed = [System.Console]::ReadKey($true).keyChar
          switch ($keyPressed) {
            ' ' {
              $this.jump()
            }
          }
      } 
    }

    update() {
      # $this.x += 1
      $this.speed -= $this.app.gravity
      $this.y -= $this.speed

      if ($this.y -ge $this.app.winHeight - 2) {
        $this.speed = 0
        $this.y = $this.app.winHeight - 2
      }

      if ($this.speed -gt $this.speedLimit) {
        $this.speed = $this.speedLimit
      }
    }

    render() {
      if ($this.y -ge 0 -and $this.y -lt $this.app.winHeight) {
        if ($this.x -ge 0 -and $this.x -lt $this.app.winWidth) {
          [Console]::SetCursorPosition($this.x, $this.y)
          Write-Host '  ' -BackgroundColor $this.color
        }
      }
    }

    jump () {
      $this.speed += $this.jumpForce
    }
}

Export-ModuleMember -Function Bird
