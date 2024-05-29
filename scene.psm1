Using module ./bird.psm1
Using module ./pipe.psm1

class Scene {
  [Object]$app
  [System.Collections.Generic.List[Object]]$objs

  Scene ([Object]$app) {
    $this.app = $app
    $this.objs = @()
    $this.load()
  }

  load () {
    $this.add([Bird]::new([int]($this.app.winWidth * 0.2), [int]($this.app.winHeight / 2), $this.app))

    $pipeGapPos = $this.app.winHeight * (Get-Random -Minimum 30 -Maximum 70) / 100
    $this.add([Pipe]::new([int]($this.app.winWidth * 0.4), $pipeGapPos, 'ceil', $this.app))
    $this.add([Pipe]::new([int]($this.app.winWidth * 0.4), $pipeGapPos, 'floor', $this.app))
  }
  

  event() {
    foreach ($obj in $this.objs) {
      try {
        $obj.event()
      } catch {

      }
    }
  }

  update () {
    for ($i = $this.objs.Count - 1; $i -ge 0; $i--) {
        $obj = $this.objs[$i]
        if ($obj -is [Pipe] -and $obj.x -lt 0) {
            $this.objs.RemoveAt($i)
        }
    }

    $lastPipeIndex = 0
    for ($i = $this.objs.Count - 1; $i -ge 0; $i--) {
        $obj = $this.objs[$i]
        if ($obj -is [Pipe] -and $obj.x -gt $this.objs[$lastPipeIndex].x) {
            $lastPipeIndex = $i
        }
    }

    if ($this.objs[$lastPipeIndex].x + 30 -lt $this.app.winWidth) {
      $pipeGapPos = $this.app.winHeight * (Get-Random -Minimum 30 -Maximum 70) / 100
      $this.add([Pipe]::new([int]($this.objs[$lastPipeIndex].x + 30), $pipeGapPos, 'ceil', $this.app))
      $this.add([Pipe]::new([int]($this.objs[$lastPipeIndex].x + 30), $pipeGapPos, 'floor', $this.app))
    }
    
    foreach ($obj in $this.objs) {
      try {
        $obj.update()
      } catch {

      }
    }
  }

  render () {
    foreach ($obj in $this.objs) {
      try {
        $obj.render()
      } catch {

      }
    }
  }

  add ([Object]$obj) {
    $this.objs.Add($obj)
  }
}

Export-ModuleMember -Function Scene 
