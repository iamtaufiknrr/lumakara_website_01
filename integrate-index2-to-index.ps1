# PowerShell Script to Integrate Index-2 Sections into Index.html
# Author: Taufik Nur Rahman Ridwan
# Description: Automatically merge best sections from index-2.html into index.html

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Lumakara - Index-2 to Index Integration" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Define file paths
$rootDir = $PSScriptRoot
$indexFile = Join-Path $rootDir "index.html"
$index2File = Join-Path $rootDir "index-2.html"
$backupFile = Join-Path $rootDir "index.html.backup"

# Check if files exist
if (-not (Test-Path $indexFile)) {
    Write-Host "❌ ERROR: index.html not found!" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $index2File)) {
    Write-Host "❌ ERROR: index-2.html not found!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Files found" -ForegroundColor Green
Write-Host "  - index.html: $indexFile" -ForegroundColor Yellow
Write-Host "  - index-2.html: $index2File" -ForegroundColor Yellow
Write-Host ""

# Backup index.html
Write-Host "📦 Creating backup..." -ForegroundColor Cyan
try {
    Copy-Item -Path $indexFile -Destination $backupFile -Force
    Write-Host "✅ Backup created: index.html.backup" -ForegroundColor Green
} catch {
    Write-Host "❌ ERROR: Failed to create backup!" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Read files
Write-Host "📖 Reading files..." -ForegroundColor Cyan
$indexContent = Get-Content -Path $indexFile -Raw -Encoding UTF8
$index2Content = Get-Content -Path $index2File -Raw -Encoding UTF8
Write-Host "✅ Files loaded" -ForegroundColor Green
Write-Host ""

# Define sections to extract from index-2.html
Write-Host "🔍 Extracting sections from index-2.html..." -ForegroundColor Cyan

# Extract Services Two section (lines 418-517 approx)
$servicesTwo = $index2Content -match '(?s)(<!--Start Services Two -->.*?<!--End Services Two -->)'
if ($matches) {
    $servicestwoSection = $matches[0]
    Write-Host "  ✅ Services Two section extracted" -ForegroundColor Green
} else {
    $servicestwoSection = ""
    Write-Host "  ⚠️  Services Two section not found" -ForegroundColor Yellow
}

# Extract Counter Two section
$counterTwo = $index2Content -match '(?s)(<!--Start Counter Two -->.*?<!--End Counter Two -->)'
if ($matches) {
    $counterTwoSection = $matches[0]
    Write-Host "  ✅ Counter Two section extracted" -ForegroundColor Green
} else {
    $counterTwoSection = ""
    Write-Host "  ⚠️  Counter Two section not found" -ForegroundColor Yellow
}

# Extract Gallery Two section
$galleryTwo = $index2Content -match '(?s)(<!--Start Gallery Two -->.*?<!--End Gallery Two -->)'
if ($matches) {
    $galleryTwoSection = $matches[0]
    Write-Host "  ✅ Gallery Two section extracted" -ForegroundColor Green
} else {
    $galleryTwoSection = ""
    Write-Host "  ⚠️  Gallery Two section not found" -ForegroundColor Yellow
}

# Extract Brand One --two section
$brandTwo = $index2Content -match '(?s)(<!--Start Brand One -->.*?brand-one--two.*?<!--End Brand One -->)'
if ($matches) {
    $brandTwoSection = $matches[0]
    Write-Host "  ✅ Brand One (two) section extracted" -ForegroundColor Green
} else {
    $brandTwoSection = ""
    Write-Host "  ⚠️  Brand One (two) section not found" -ForegroundColor Yellow
}

# Extract Testimonials Two section
$testimonialsTwo = $index2Content -match '(?s)(<!--Start Testimonials Two -->.*?<!--End Testimonials Two -->)'
if ($matches) {
    $testimonialsTwoSection = $matches[0]
    Write-Host "  ✅ Testimonials Two section extracted" -ForegroundColor Green
} else {
    $testimonialsTwoSection = ""
    Write-Host "  ⚠️  Testimonials Two section not found" -ForegroundColor Yellow
}

# Extract Team Two section
$teamTwo = $index2Content -match '(?s)(<!--Start Team Two -->.*?<!--End Team Two -->)'
if ($matches) {
    $teamTwoSection = $matches[0]
    Write-Host "  ✅ Team Two section extracted" -ForegroundColor Green
} else {
    $teamTwoSection = ""
    Write-Host "  ⚠️  Team Two section not found" -ForegroundColor Yellow
}

# Extract Pricing One section
$pricingOne = $index2Content -match '(?s)(<!--Start Pricing One -->.*?<!--End Pricing One -->)'
if ($matches) {
    $pricingOneSection = $matches[0]
    Write-Host "  ✅ Pricing One section extracted" -ForegroundColor Green
} else {
    $pricingOneSection = ""
    Write-Host "  ⚠️  Pricing One section not found" -ForegroundColor Yellow
}

# Extract Feature One section (Scrolling Text)
$featureOne = $index2Content -match '(?s)(<!--Feature One Start-->.*?<!--Feature One End-->)'
if ($matches) {
    $featureOneSection = $matches[0]
    Write-Host "  ✅ Feature One section extracted" -ForegroundColor Green
} else {
    $featureOneSection = ""
    Write-Host "  ⚠️  Feature One section not found" -ForegroundColor Yellow
}

# Extract Blog Two section
$blogTwo = $index2Content -match '(?s)(<!--Start Blog Two -->.*?<!--End Blog Two -->)'
if ($matches) {
    $blogTwoSection = $matches[0]
    Write-Host "  ✅ Blog Two section extracted" -ForegroundColor Green
} else {
    $blogTwoSection = ""
    Write-Host "  ⚠️  Blog Two section not found" -ForegroundColor Yellow
}

Write-Host ""

# Combine all new sections
$newSections = @"

        <!-- ========================================== -->
        <!-- ENHANCED SECTIONS FROM INDEX-2 -->
        <!-- ========================================== -->

        $servicestwoSection

        $counterTwoSection

        $galleryTwoSection

        $brandTwoSection

        $testimonialsTwoSection

        $teamTwoSection

        $pricingOneSection

        $featureOneSection

        $blogTwoSection

        <!-- ========================================== -->
        <!-- END ENHANCED SECTIONS -->
        <!-- ========================================== -->

"@

# Find insertion point (before <!--Start Slogan One -->)
Write-Host "🔧 Inserting sections into index.html..." -ForegroundColor Cyan

$insertionPoint = '<!--End Blog One -->'
$replacementText = $insertionPoint + $newSections

$newIndexContent = $indexContent -replace [regex]::Escape($insertionPoint), $replacementText

# Write new index.html
try {
    Set-Content -Path $indexFile -Value $newIndexContent -Encoding UTF8
    Write-Host "✅ Sections successfully integrated!" -ForegroundColor Green
} catch {
    Write-Host "❌ ERROR: Failed to write new index.html!" -ForegroundColor Red
    Write-Host "Restoring from backup..." -ForegroundColor Yellow
    Copy-Item -Path $backupFile -Destination $indexFile -Force
    exit 1
}

Write-Host ""

# Verify integration
$newContent = Get-Content -Path $indexFile -Raw -Encoding UTF8
$newLineCount = ($newContent -split "`n").Count
$oldLineCount = ($indexContent -split "`n").Count
$addedLines = $newLineCount - $oldLineCount

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Integration Summary:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Original lines: $oldLineCount" -ForegroundColor Yellow
Write-Host "New lines: $newLineCount" -ForegroundColor Yellow
Write-Host "Added lines: $addedLines" -ForegroundColor Green
Write-Host ""

Write-Host "Sections Integrated:" -ForegroundColor Cyan
if ($servicestwoSection) { Write-Host "  ✅ Services Two (What We Offer)" -ForegroundColor Green }
if ($counterTwoSection) { Write-Host "  ✅ Counter Two (Stats)" -ForegroundColor Green }
if ($galleryTwoSection) { Write-Host "  ✅ Gallery Two (Our Working Gallery)" -ForegroundColor Green }
if ($brandTwoSection) { Write-Host "  ✅ Brand Logos" -ForegroundColor Green }
if ($testimonialsTwoSection) { Write-Host "  ✅ Testimonials Two" -ForegroundColor Green }
if ($teamTwoSection) { Write-Host "  ✅ Team Two (Meet Our Experts)" -ForegroundColor Green }
if ($pricingOneSection) { Write-Host "  ✅ Pricing One (Pricing Plans)" -ForegroundColor Green }
if ($featureOneSection) { Write-Host "  ✅ Feature One (Scrolling Text)" -ForegroundColor Green }
if ($blogTwoSection) { Write-Host "  ✅ Blog Two (Latest Blogs)" -ForegroundColor Green }
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✅ Integration Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📝 What's Next:" -ForegroundColor Cyan
Write-Host "  1. Test index.html in browser" -ForegroundColor Yellow
Write-Host "  2. Verify all sections display correctly" -ForegroundColor Yellow
Write-Host "  3. Check animations work properly" -ForegroundColor Yellow
Write-Host "  4. Test responsive layouts" -ForegroundColor Yellow
Write-Host "  5. If issues occur, restore from backup:" -ForegroundColor Yellow
Write-Host "     Copy-Item index.html.backup index.html -Force" -ForegroundColor Gray
Write-Host ""
Write-Host "🎉 Your homepage is now super complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
