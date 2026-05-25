param(
    [string]$InputJson = "data/world/e01_world_map_nodes_v0_1.json",
    [string]$OutputSvg = "assets/world/e01_world_map_blockout_v0_1.svg"
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$inputPath = Join-Path $root $InputJson
$outputPath = Join-Path $root $OutputSvg
$outputDir = Split-Path -Parent $outputPath

[System.IO.Directory]::CreateDirectory($outputDir) | Out-Null

$data = Get-Content -Raw -LiteralPath $inputPath | ConvertFrom-Json

$width = 960
$height = 640
$marginX = 70
$marginY = 58
$plotW = 760
$plotH = 520

function Map-X([double]$x) {
    return [math]::Round($script:marginX + ($x / 100.0) * $script:plotW, 2)
}

function Map-Y([double]$y) {
    return [math]::Round($script:marginY + ($y / 100.0) * $script:plotH, 2)
}

function Esc([object]$value) {
    return [System.Security.SecurityElement]::Escape([string]$value)
}

$priorityColor = @{
    P0 = "#f3f7ef"
    P1 = "#58d7f6"
    P2 = "#7f8b96"
}

$tierStroke = @{
    A0 = "#74f2c5"
    A1 = "#b9f27c"
    A2 = "#ffd166"
    A3 = "#ff8f5a"
    A4 = "#b49cff"
}

$linkStyle = @{
    main = "stroke:#edf8ff;stroke-width:3.2;opacity:0.86"
    branch = "stroke:#70d6ff;stroke-width:2.2;opacity:0.62;stroke-dasharray:7 6"
    boss_branch = "stroke:#ff8f5a;stroke-width:2.2;opacity:0.68;stroke-dasharray:4 5"
    remote_signal = "stroke:#b49cff;stroke-width:1.9;opacity:0.55;stroke-dasharray:2 7"
    blockade = "stroke:#ff5a66;stroke-width:2.1;opacity:0.55;stroke-dasharray:9 5 2 5"
    internal_crisis = "stroke:#ffd166;stroke-width:2.0;opacity:0.7;stroke-dasharray:3 3"
}

$nodeById = @{}
foreach ($node in $data.nodes) {
    $nodeById[$node.id] = $node
}

$sb = [System.Text.StringBuilder]::new()
[void]$sb.AppendLine('<?xml version="1.0" encoding="UTF-8"?>')
[void]$sb.AppendLine('<svg xmlns="http://www.w3.org/2000/svg" width="960" height="640" viewBox="0 0 960 640" role="img" aria-labelledby="title desc">')
[void]$sb.AppendLine('  <title id="title">Atomic Ad Survivors E01 World Map Blockout v0.1</title>')
[void]$sb.AppendLine('  <desc id="desc">Normalized 0-100 blockout map for E01 local nodes. This is not real GPS data.</desc>')
[void]$sb.AppendLine('  <defs>')
[void]$sb.AppendLine('    <filter id="softGlow" x="-40%" y="-40%" width="180%" height="180%">')
[void]$sb.AppendLine('      <feGaussianBlur stdDeviation="3" result="blur"/>')
[void]$sb.AppendLine('      <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>')
[void]$sb.AppendLine('    </filter>')
[void]$sb.AppendLine('    <style><![CDATA[')
[void]$sb.AppendLine('      .label { font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; font-size: 10px; fill: #dbe7ec; }')
[void]$sb.AppendLine('      .small { font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; font-size: 9px; fill: #9fb2bd; }')
[void]$sb.AppendLine('      .title { font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; font-size: 18px; font-weight: 700; fill: #eef7f8; }')
[void]$sb.AppendLine('      .subtitle { font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; font-size: 11px; fill: #a9bbc3; }')
[void]$sb.AppendLine('      .legend { font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif; font-size: 11px; fill: #d8e4e8; }')
[void]$sb.AppendLine('      .grid { stroke: #263540; stroke-width: 1; opacity: 0.42; }')
[void]$sb.AppendLine('    ]]></style>')
[void]$sb.AppendLine('  </defs>')
[void]$sb.AppendLine('  <rect width="960" height="640" fill="#10161a"/>')

[void]$sb.AppendLine('  <g id="grid">')
foreach ($step in 0..10) {
    $x = Map-X($step * 10)
    $y = Map-Y($step * 10)
    [void]$sb.AppendLine("    <line class=""grid"" x1=""$x"" y1=""$marginY"" x2=""$x"" y2=""$($marginY + $plotH)""/>")
    [void]$sb.AppendLine("    <line class=""grid"" x1=""$marginX"" y1=""$y"" x2=""$($marginX + $plotW)"" y2=""$y""/>")
}
[void]$sb.AppendLine('  </g>')

[void]$sb.AppendLine('  <g id="rough-silhouette" opacity="0.95">')
[void]$sb.AppendLine('    <path d="M128 268 C94 340 111 438 91 542 C175 580 287 562 352 508 C421 451 468 430 540 390 C602 356 595 294 548 250 C515 219 520 172 482 133 C426 78 349 105 315 164 C285 217 245 226 199 238 C169 247 150 248 128 268 Z" fill="#17252d" stroke="#3a5661" stroke-width="2"/>')
[void]$sb.AppendLine('    <ellipse cx="255" cy="430" rx="145" ry="154" fill="#1b4250" opacity="0.34"/>')
[void]$sb.AppendLine('    <ellipse cx="497" cy="276" rx="150" ry="96" fill="#263a52" opacity="0.35"/>')
[void]$sb.AppendLine('    <ellipse cx="610" cy="410" rx="155" ry="110" fill="#244c44" opacity="0.27"/>')
[void]$sb.AppendLine('    <ellipse cx="520" cy="503" rx="150" ry="100" fill="#57383a" opacity="0.26"/>')
[void]$sb.AppendLine('    <ellipse cx="496" cy="342" rx="108" ry="80" fill="#203c35" opacity="0.42"/>')
[void]$sb.AppendLine('    <ellipse cx="472" cy="188" rx="106" ry="72" fill="#33295c" opacity="0.26"/>')
[void]$sb.AppendLine('  </g>')

[void]$sb.AppendLine('  <g id="region-labels">')
[void]$sb.AppendLine('    <text class="small" x="124" y="604">west coast / harbor shadow</text>')
[void]$sb.AppendLine('    <text class="small" x="448" y="174">broadcast high signal</text>')
[void]$sb.AppendLine('    <text class="small" x="610" y="428">outer housing belt</text>')
[void]$sb.AppendLine('    <text class="small" x="500" y="542">industrial gray zone</text>')
[void]$sb.AppendLine('  </g>')

[void]$sb.AppendLine('  <g id="links" fill="none">')
foreach ($link in $data.links) {
    $from = $nodeById[$link.from]
    $to = $nodeById[$link.to]
    if ($null -eq $from -or $null -eq $to) { continue }
    $x1 = Map-X($from.x)
    $y1 = Map-Y($from.y)
    $x2 = Map-X($to.x)
    $y2 = Map-Y($to.y)
    $style = $linkStyle[$link.type]
    if (-not $style) { $style = "stroke:#9fb2bd;stroke-width:1.8;opacity:0.55" }
    [void]$sb.AppendLine("    <line x1=""$x1"" y1=""$y1"" x2=""$x2"" y2=""$y2"" style=""$style""/>")
}
[void]$sb.AppendLine('  </g>')

[void]$sb.AppendLine('  <g id="nodes">')
foreach ($node in $data.nodes) {
    $x = Map-X($node.x)
    $y = Map-Y($node.y)
    $fill = $priorityColor[$node.priority]
    $stroke = $tierStroke[$node.extractionTier]
    $radius = 6
    if ($node.priority -eq "P0") { $radius = 8 }
    if ($node.isBossNode) { $radius = $radius + 2 }
    $opacity = "0.98"
    if ($node.extractionTier -eq "A4") { $opacity = "0.62" }

    if ($node.isBossNode) {
        [void]$sb.AppendLine("    <circle cx=""$x"" cy=""$y"" r=""$($radius + 5)"" fill=""none"" stroke=""#ff5a66"" stroke-width=""2.2"" opacity=""0.85"" filter=""url(#softGlow)""/>")
    }

    [void]$sb.AppendLine("    <circle cx=""$x"" cy=""$y"" r=""$radius"" fill=""$fill"" stroke=""$stroke"" stroke-width=""2.4"" opacity=""$opacity""/>")

    if ($node.isStartNode) {
        [void]$sb.AppendLine("    <circle cx=""$x"" cy=""$y"" r=""$($radius + 8)"" fill=""none"" stroke=""#74f2c5"" stroke-width=""2"" opacity=""0.9""/>")
    }

    $label = Esc($node.id)
    $labelX = [math]::Round($x + 9, 2)
    $labelY = [math]::Round($y - 7, 2)
    [void]$sb.AppendLine("    <text class=""label"" x=""$labelX"" y=""$labelY"">$label</text>")

    if ($node.priority -eq "P0" -or $node.isBossNode) {
        $name = Esc($node.nameKo)
        $nameY = [math]::Round($labelY + 12, 2)
        [void]$sb.AppendLine("    <text class=""small"" x=""$labelX"" y=""$nameY"">$name</text>")
    }
}
[void]$sb.AppendLine('  </g>')

[void]$sb.AppendLine('  <g id="frame-and-legend">')
[void]$sb.AppendLine('    <rect x="24" y="18" width="912" height="604" rx="8" fill="none" stroke="#30424d" stroke-width="1.2"/>')
[void]$sb.AppendLine('    <text class="title" x="36" y="45">E01 World Map Blockout v0.1</text>')
[void]$sb.AppendLine('    <text class="subtitle" x="36" y="64">normalized 0-100 layout, not GPS / silhouette + alias exposure target</text>')
[void]$sb.AppendLine('    <rect x="740" y="34" width="174" height="154" rx="7" fill="#111c21" stroke="#344853" opacity="0.92"/>')
[void]$sb.AppendLine('    <text class="legend" x="756" y="58">Priority</text>')
[void]$sb.AppendLine('    <circle cx="762" cy="80" r="6" fill="#f3f7ef" stroke="#74f2c5" stroke-width="2"/>')
[void]$sb.AppendLine('    <text class="legend" x="776" y="84">P0 visible start</text>')
[void]$sb.AppendLine('    <circle cx="762" cy="105" r="6" fill="#58d7f6" stroke="#ffd166" stroke-width="2"/>')
[void]$sb.AppendLine('    <text class="legend" x="776" y="109">P1 expansion</text>')
[void]$sb.AppendLine('    <circle cx="762" cy="130" r="6" fill="#7f8b96" stroke="#ff8f5a" stroke-width="2"/>')
[void]$sb.AppendLine('    <text class="legend" x="776" y="134">P2 late/branch</text>')
[void]$sb.AppendLine('    <circle cx="762" cy="156" r="10" fill="none" stroke="#ff5a66" stroke-width="2"/>')
[void]$sb.AppendLine('    <text class="legend" x="776" y="160">boss slot</text>')
[void]$sb.AppendLine('    <text class="small" x="756" y="178">origin: R08-L02</text>')
[void]$sb.AppendLine('  </g>')
[void]$sb.AppendLine('</svg>')

$encoding = [System.Text.UTF8Encoding]::new($false)
[System.IO.File]::WriteAllText($outputPath, $sb.ToString(), $encoding)

Write-Output "Generated $OutputSvg"
