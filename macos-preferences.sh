#!/usr/bin/env bash
#
# macos-preferences.sh
# ---------------------------------------------------------------------------
# Personal macOS preference bootstrap for Diego.
#
# Run this after setting up a fresh macOS machine to apply the system
# preferences you like, so you don't have to click through System Settings
# every time. Every command is commented so future-you understands exactly
# what each line does and can safely add / remove / tweak entries.
#
# Usage:
#   bash ~/macos-preferences.sh          # apply all preferences
#   chmod +x ~/macos-preferences.sh      # (once) make it directly executable
#   ~/macos-preferences.sh               # then run it like a normal command
#
# Notes:
#   - None of this needs `sudo` — everything here writes to *your* user
#     preference domains via `defaults write`.
#   - `defaults write` only updates the on-disk preference; the relevant
#     daemon/app has to re-read it. We call `activateSettings -u` at the end
#     to nudge the settings system, but a few changes only fully take effect
#     after a log out / restart (called out per-section below).
#   - Safe to re-run: `defaults write` just overwrites the same key, so this
#     script is idempotent.
# ---------------------------------------------------------------------------

# Bash safety flags:
#   -e  exit immediately if any command fails
#   -u  error on use of an unset variable (catches typos)
#   -o pipefail  a pipeline fails if ANY stage fails, not just the last
set -euo pipefail

# Small helper so each section prints a readable heading as it runs.
section() { printf '\n\033[1;34m==> %s\033[0m\n' "$1"; }


# ===========================================================================
# Trackpad: Three-Finger Drag
# ---------------------------------------------------------------------------
# Lets you move a window by dragging its title bar with three fingers (and
# replaces click-and-hold dragging for text selection, moving files, etc.).
#
# There are two separate preference domains because macOS tracks the built-in
# trackpad and an external Magic Trackpad independently — we set both so the
# behavior is identical no matter which one is in use.
#
# Trade-off: enabling this reassigns the THREE-finger gesture, so any
# Mission Control / "swipe between full-screen apps" gesture you had on three
# fingers moves to FOUR fingers (System Settings > Trackpad > More Gestures).
#
# Takes effect immediately in most cases; if the gesture doesn't respond,
# log out and back in (or restart) so the trackpad daemon reloads it.
# ===========================================================================
section "Trackpad: enabling three-finger drag"

# Built-in (laptop) trackpad.
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# External Magic Trackpad (Bluetooth). Harmless to set even if you don't own one.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true


# ===========================================================================
# Keyboard: fast key repeat + no accent popup
# ---------------------------------------------------------------------------
# Two related tweaks that make a keyboard feel much faster:
#
# 1) ApplePressAndHoldEnabled = false
#    By default, holding a key (e.g. holding "e") pops up the accent-character
#    menu (é, è, ê, …) instead of repeating the key. Turning this OFF restores
#    classic key-repeat behavior — hold a key and it types repeatedly. This is
#    the setting that kills the accent popup you dislike.
#    (You can still type accents via the Character Viewer or option-key combos.)
#
# 2) KeyRepeat / InitialKeyRepeat control the repeat SPEED and the initial
#    DELAY before repeating starts. The numbers are in units of ~15ms:
#      - KeyRepeat:        how fast it repeats once going. 2 = ~30ms (very fast).
#                          Lower is faster; 1 is the absolute fastest. The System
#                          Settings slider bottoms out at 2, so 1 is "faster than
#                          the UI allows".
#      - InitialKeyRepeat: how long to hold before repeat kicks in. 15 = ~225ms.
#                          Lower = shorter wait; 10 (~150ms) feels snappier still.
#
# NOTE: these fully take effect only in apps launched AFTER the change — log out
# and back in (or restart) to apply everywhere.
# ===========================================================================
section "Keyboard: fast key repeat + disabling accent popup"

# Disable the press-and-hold accent menu so held keys repeat instead.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fast repeat rate (2 = very fast; drop to 1 for the fastest possible).
defaults write NSGlobalDomain KeyRepeat -int 2

# Short delay before repeating starts (15 ≈ 225ms; try 10 for even snappier).
defaults write NSGlobalDomain InitialKeyRepeat -int 15


# ===========================================================================
# Dock: auto-hide + no recent apps
# ---------------------------------------------------------------------------
# Hide the Dock automatically; it slides in when you push the pointer to its
# screen edge. Frees up screen space. The two extra tweaks make show/hide feel
# instant instead of the default lazy animation. Also turn off the trailing
# "recent applications" section that macOS appends to the Dock.
#
# Dock preferences are owned by the Dock process, so unlike the settings above
# they need `killall Dock` (below) to take effect — the Dock relaunches itself
# automatically and re-reads its prefs.
# ===========================================================================
section "Dock: enabling auto-hide + hiding recent apps"

# Turn on auto-hide.
defaults write com.apple.dock autohide -bool true

# Remove the delay before the Dock appears when you hit the screen edge (0s).
defaults write com.apple.dock autohide-delay -float 0

# Speed up the show/hide slide animation (smaller = faster; 0 is instant).
defaults write com.apple.dock autohide-time-modifier -float 0.15

# Hide the auto-populated "recent applications" section at the end of the Dock.
defaults write com.apple.dock show-recents -bool false

# Restart the Dock so the changes above apply now.
killall Dock


# ===========================================================================
# Windows: drag from anywhere with Ctrl+Cmd
# ---------------------------------------------------------------------------
# Lets you move a window by holding Ctrl+Cmd (⌃⌘) and dragging ANYWHERE inside
# it — not just the title bar. Great for repositioning windows without hunting
# for a title bar (or for windows that barely have one).
#
# Built into macOS 15 (Sequoia) and later, so it works on this machine. The
# hold-modifier is Ctrl+Cmd by default.
#
# Heads-up: a few apps already use Ctrl+Cmd-drag for their own features, so if
# something in a specific app stops working, that's the collision — set this
# back to false if it ever gets in your way.
#
# NOTE: applies to apps launched AFTER the change — log out / restart to apply
# everywhere.
# ===========================================================================
section "Windows: enabling Ctrl+Cmd drag-from-anywhere"

# Enable click-and-drag anywhere in a window (with the Ctrl+Cmd modifier held).
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true


# ===========================================================================
# Text input: disable auto-capitalization and autocorrect
# ---------------------------------------------------------------------------
# Turn off the two "helpful" typing features that most often get in the way:
#
#   - NSAutomaticCapitalizationEnabled:      auto-capitalizing the first letter
#                                            of sentences. Off = type exactly
#                                            what you type.
#   - NSAutomaticSpellingCorrectionEnabled:  autocorrect that silently rewrites
#                                            words as you type. Off = no more
#                                            surprise substitutions.
#
# These are the same toggles as System Settings > Keyboard > Input Sources >
# Edit… ("Correct spelling automatically" / "Capitalize words automatically").
# Red-squiggle spell-CHECKING is a separate setting and is left untouched.
#
# Related knobs you could add here if you want (all NSGlobalDomain, -bool false):
#   NSAutomaticPeriodSubstitutionEnabled  (double-space -> period)
#   NSAutomaticDashSubstitutionEnabled    (-- -> em dash)
#   NSAutomaticQuoteSubstitutionEnabled   (straight quotes -> curly quotes)
#
# NOTE: applies to apps launched AFTER the change — log out / restart to apply
# everywhere.
# ===========================================================================
section "Text input: disabling auto-capitalization and autocorrect"

# Stop auto-capitalizing the first letter of sentences.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Stop autocorrect from rewriting words as you type.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# ===========================================================================
# Menu Bar: show Bluetooth indicator
# ---------------------------------------------------------------------------
# Adds the Bluetooth icon to the menu bar (Control Center), same as toggling
# System Settings > Control Center > Bluetooth > "Show in Menu Bar".
#
# The value is an NSNumber that also encodes position, but 18 is the standard
# "always show" value Control Center itself writes when you flip that switch.
#
# Control Center owns this preference domain, so it needs `killall
# ControlCenter` (below) to pick up the change and redraw the menu bar.
# ===========================================================================
section "Menu Bar: showing Bluetooth indicator"

# Always show the Bluetooth icon in the menu bar.
defaults write com.apple.controlcenter Bluetooth -int 18

# Restart Control Center so the menu bar redraws with the new icon.
killall ControlCenter


# ===========================================================================
# Appearance: enable Dark Mode
# ---------------------------------------------------------------------------
# Switches the system appearance to Dark. This is the same toggle as
# System Settings > Appearance > Dark.
#
# NOTE: applies immediately to newly launched apps; already-running apps
# (and some System UI elements) may need a log out / restart to fully match.
# ===========================================================================
section "Appearance: enabling Dark Mode"

# Set the system-wide UI style to Dark.
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"


# ===========================================================================
# Apply changes
# ---------------------------------------------------------------------------
# Ask the macOS settings system to re-read the preference files we just wrote,
# so changes apply without a full log out where possible. This private tool
# is the same one System Settings uses internally.
# ===========================================================================
section "Applying settings"
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

printf '\n\033[1;32mDone.\033[0m Preferences applied. Some changes may need a log out / restart to fully take effect.\n'
