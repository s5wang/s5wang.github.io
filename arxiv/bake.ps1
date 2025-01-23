$entry = "25-cm"

Push-Location $PSScriptRoot

$source = "..\tex"
$dist = "dist"
$arch = "arxiv.tar.gz"

foreach ($folder in $dist, "out", $arch) {
  if (Test-Path $folder) {
    Remove-Item -Recurse -Force $folder
  }
}
New-Item -ItemType Directory $dist | Out-Null

Get-Content "$source\$entry.tex" | ForEach-Object {
  if ($_.StartsWith("%?deps ")) {
    $_.Substring(7).Split(",") | ForEach-Object {
      $dep = $_.Trim()
      if ($dep.StartsWith("@")) {
        switch ($dep) {
          "@bib-commons" {
            Copy-Item "$source\bib-commons\bib-commons.sty" "$dist\bib-commons.sty"
            Copy-Item "..\public\pdf\$entry.bbl" "$dist\main.bbl"

            "\def\BibCommonsStandalone{}"
          }
        }
      }
      else {
        Copy-Item "$source\$dep" "$dist\$dep"
      }
    }
  }
  else {
    $_
  }
} | Set-Content "$dist\main.tex"

tar -cvvzf $arch -C $dist .

Pop-Location
