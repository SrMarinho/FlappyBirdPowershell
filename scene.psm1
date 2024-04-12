Using module ./bird.psm1

class Scene {
  [Object]$app
  [System.Collections.Generic.List[Object]]$objs

  Scene ([Object]$app) {
    $this.app = $app
    $this.objs = @()
    $this.load()
  }

  load () {
    $this.add([Bird]::new([int]($this.app.winWidth * 0.20), [int]($this.app.winHeight / 2), $this.app))
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
