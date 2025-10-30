# PowerShell Script to Add Netlify Identity Widget to All HTML Files
# Author: Taufik Nur Rahman Ridwan
# Description: Automatically adds Netlify Identity widget before closing </body> tag

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Lumakara CMS - Add Identity Widget" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Define the root directory
$rootDir = Split-Path -Parent $PSScriptRoot
Write-Host "Root Directory: $rootDir" -ForegroundColor Yellow
Write-Host ""

# Define the snippet to add
$identitySnippet = @"

<!-- Netlify Identity Widget -->
<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
<script>
  if (window.netlifyIdentity) {
    window.netlifyIdentity.on("init", user => {
      if (!user) {
        window.netlifyIdentity.on("login", () => {
          document.location.href = "/admin/";
        });
      }
    });
  }
</script>
<script src="/assets/js/cms-integration.js"></script>
"@

# Get all HTML files (excluding admin folder)
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -File -Recurse | 
    Where-Object { $_.FullName -notlike "*\admin\*" -and $_.FullName -notlike "*\node_modules\*" }

Write-Host "Found $($htmlFiles.Count) HTML files to process" -ForegroundColor Green
Write-Host ""

$processedCount = 0
$skippedCount = 0
$errorCount = 0

foreach ($file in $htmlFiles) {
    try {
        # Read file content
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        
        # Check if snippet already exists
        if ($content -match "netlify-identity-widget.js") {
            Write-Host "⏭️  SKIPPED: $($file.Name) - Already has Identity widget" -ForegroundColor Yellow
            $skippedCount++
            continue
        }
        
        # Check if file has closing body tag
        if ($content -notmatch "</body>") {
            Write-Host "⚠️  SKIPPED: $($file.Name) - No closing </body> tag found" -ForegroundColor Yellow
            $skippedCount++
            continue
        }
        
        # Add snippet before closing body tag
        $newContent = $content -replace "</body>", "$identitySnippet`n</body>"
        
        # Backup original file
        $backupPath = $file.FullName + ".backup"
        Copy-Item -Path $file.FullName -Destination $backupPath -Force
        
        # Write new content
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
        
        Write-Host "✅ PROCESSED: $($file.Name)" -ForegroundColor Green
        $processedCount++
        
    } catch {
        Write-Host "❌ ERROR: $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✅ Processed: $processedCount files" -ForegroundColor Green
Write-Host "⏭️  Skipped: $skippedCount files" -ForegroundColor Yellow
Write-Host "❌ Errors: $errorCount files" -ForegroundColor Red
Write-Host ""

if ($processedCount -gt 0) {
    Write-Host "Backup files created with .backup extension" -ForegroundColor Cyan
    Write-Host "To restore, rename .backup files back to .html" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host "Done! Press any key to exit..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
