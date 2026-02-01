# ==============================================================================
# PROJECT IRON PEN: THE DIGITAL LOBOTOMY
# OPERATION: EXCISE CLOUD & SOCIAL ORGANS
# TARGET: RodComp1 / Local Sovereign Architecture
# ==============================================================================

Write-Host "Initializing Surgical Procedure..." -ForegroundColor Cyan

# --- 1. CORE ORGAN REMOVAL (Social & Messaging Sources) ---
$social_folders = @(
    "src/discord",
    "src/signal",
    "src/slack",
    "src/telegram",
    "src/whatsapp",
    "src/imessage",
    "src/line",
    "src/googlechat",
    "src/msteams"
)

foreach ($folder in $social_folders) {
    if (Test-Path $folder) {
        Write-Host "Excising $folder..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $folder
    }
}

# --- 2. REMOVE CONNECTIVE TISSUE (Plugin Actions & Tools) ---
# We must remove the files that link the core to the deleted folders to prevent phantom limb pain (compilation errors)
$plugin_files = @(
    # Channel Actions
    "src/channels/plugins/actions/discord.ts",
    "src/channels/plugins/actions/discord",
    "src/channels/plugins/actions/signal.ts",
    "src/channels/plugins/actions/telegram.ts",
    "src/channels/plugins/actions/slack.actions.ts",
    "src/channels/plugins/actions/slack.ts",
    
    # Status Issues
    "src/channels/plugins/status-issues/discord.ts",
    "src/channels/plugins/status-issues/telegram.ts",
    "src/channels/plugins/status-issues/whatsapp.ts",
    "src/channels/plugins/status-issues/bluebubbles.ts",

    # Agent Tools
    "src/agents/tools/discord-actions-guild.ts",
    "src/agents/tools/discord-actions-messaging.ts",
    "src/agents/tools/discord-actions-moderation.ts",
    "src/agents/tools/discord-actions.ts",
    "src/agents/tools/slack-actions.ts",
    "src/agents/tools/telegram-actions.ts",
    "src/agents/tools/whatsapp-actions.ts",
    
    # Onboarding Wizards (Cloud dependent)
    "src/channels/plugins/onboarding/discord.ts",
    "src/channels/plugins/onboarding/slack.ts",
    "src/channels/plugins/onboarding/telegram.ts",
    "src/channels/plugins/onboarding/whatsapp.ts",
    "src/channels/plugins/onboarding/signal.ts",
    "src/channels/plugins/onboarding/imessage.ts"
)

foreach ($file in $plugin_files) {
    if (Test-Path $file) {
        Write-Host "Severing connection: $file..." -ForegroundColor DarkYellow
        Remove-Item -Recurse -Force $file
    }
}

# --- 3. REMOVE TELEMETRY & DIAGNOSTICS ---
$telemetry_files = @(
    "src/infra/diagnostic-events.ts",
    "src/infra/system-events.ts",
    "src/infra/system-events.test.ts",
    "scripts/auth-monitor.sh",
    "scripts/claude-auth-status.sh",
    "scripts/debug-claude-usage.ts"
)

foreach ($file in $telemetry_files) {
    if (Test-Path $file) {
        Write-Host "Removing telemetry: $file..." -ForegroundColor Magenta
        Remove-Item -Recurse -Force $file
    }
}

# --- 4. REMOVE OS SPECIFIC (Mac/Mobile) ---
$os_vestiges = @(
    "src/macos",
    "scripts/build-and-run-mac.sh",
    "scripts/create-dmg.sh",
    "scripts/codesign-mac-app.sh",
    "scripts/ios-team-id.sh",
    "scripts/mobile-reauth.sh",
    "scripts/notarize-mac-artifact.sh",
    "scripts/package-mac-app.sh",
    "scripts/package-mac-dist.sh",
    "assets/dmg-background.png",
    "assets/dmg-background-small.png"
)

foreach ($file in $os_vestiges) {
    if (Test-Path $file) {
        Write-Host "Removing OS specific vestige: $file..." -ForegroundColor Gray
        Remove-Item -Recurse -Force $file
    }
}

# --- 5. PRUNE SKILLS (Keeping Whisper) ---
$bloat_skills = @(
    "skills/spotify-player",
    "skills/weather",
    "skills/summarize",
    "skills/canvas", # Assuming Canvas UI is handled by `ui` folder, removing separate skill
    "skills/gog"
)

foreach ($skill in $bloat_skills) {
    if (Test-Path $skill) {
        Write-Host "Pruning skill: $skill..." -ForegroundColor Red
        Remove-Item -Recurse -Force $skill
    }
}

Write-Host "---------------------------------------------------"
Write-Host "SURGERY COMPLETE." -ForegroundColor Green
Write-Host "CRITICAL NEXT STEP: Open 'src/channels/registry.ts' and 'src/plugins/registry.ts'."
Write-Host "You must manually remove imports referring to the deleted files."
Write-Host "Then run: pnpm install"
Write-Host "---------------------------------------------------"