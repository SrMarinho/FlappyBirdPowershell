Using module ./entities/bird.psm1
Using module ./entities/pipe.psm1


class RenderizableFactory {
  static [object] create([string]$name, $params){
    $entities = @{Bird = [Bird]; Pipe = [Pipe]}
    if ($entities -contains $name) {
      return New-Object -TypeName $name -ArgumentList $params
    }
    return $null
  }
}
