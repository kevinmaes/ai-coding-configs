#!/usr/bin/env tsx

import { intro, outro, confirm, spinner, log } from "@clack/prompts";
import kleur from "kleur";
import { execSync } from "child_process";
import fs from "fs";
import path from "path";
import os from "os";

// Helper to run shell commands
function runCommand(command: string): string {
  try {
    return execSync(command, { encoding: "utf8" });
  } catch (error) {
    return "";
  }
}

// Helper to copy directory recursively
function copyDir(src: string, dest: string) {
  // Create destination directory if it doesn't exist
  if (!fs.existsSync(dest)) {
    fs.mkdirSync(dest, { recursive: true });
  }

  // Copy all files
  const entries = fs.readdirSync(src, { withFileTypes: true });

  for (const entry of entries) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);

    if (entry.isDirectory()) {
      copyDir(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

async function main() {
  console.clear();

  intro(kleur.gradient.teen("🤖 AI Coding Configs Setup"));

  // Detect installed tools
  const claudeDir = path.join(os.homedir(), ".claude");
  const claudeExists = fs.existsSync(claudeDir);

  // Note: Cursor uses .cursorrules in project root, not a global config
  const cursorConfigExists = fs.existsSync(".cursorrules");

  log.info(kleur.dim("Detected tools:"));
  log.info(
    kleur.dim(
      `  Claude: ${claudeExists ? "✓ Config directory found" : "✗ Not found"}`,
    ),
  );
  log.info(kleur.dim(`  Cursor: Uses project-level .cursorrules files`));
  console.log();

  let configuredTools = [];

  // Setup Claude
  const setupClaude = await confirm({
    message: "Configure Claude?",
    initialValue: claudeExists,
  });

  if (setupClaude) {
    const s = spinner();
    s.start("Syncing Claude configuration");

    try {
      // Create .claude directory if it doesn't exist
      if (!fs.existsSync(claudeDir)) {
        fs.mkdirSync(claudeDir, { recursive: true });
      }

      // Copy all files from claude/ to ~/.claude/
      const claudeSource = path.join(process.cwd(), "claude");
      copyDir(claudeSource, claudeDir);

      s.stop("✅ Claude configured successfully");
      configuredTools.push("Claude");
    } catch (error) {
      s.stop("❌ Failed to configure Claude");
      log.error(kleur.red(error.message));
    }
  }

  // Setup Cursor
  const setupCursor = await confirm({
    message: "Configure Cursor? (will copy .cursorrules to current directory)",
    initialValue: true,
  });

  if (setupCursor) {
    const s = spinner();
    s.start("Syncing Cursor configuration");

    try {
      const cursorSource = path.join(process.cwd(), "cursor", ".cursorrules");
      const cursorDest = path.join(process.cwd(), ".cursorrules");

      if (fs.existsSync(cursorSource)) {
        fs.copyFileSync(cursorSource, cursorDest);
        s.stop("✅ Cursor configured successfully");
        configuredTools.push("Cursor");
      } else {
        s.stop("⚠️  No .cursorrules file found in cursor/ directory");
      }
    } catch (error) {
      s.stop("❌ Failed to configure Cursor");
      log.error(kleur.red(error.message));
    }
  }

  // Run validation if any tools were configured
  if (configuredTools.length > 0) {
    console.log();
    const s = spinner();
    s.start("Validating synchronization");

    const validationResult = runCommand("./scripts/validate-sync.sh 2>&1");
    s.stop();

    if (validationResult.includes("❌")) {
      log.warning(kleur.yellow("Some principles are not fully synced"));
      log.info(kleur.dim("Run `ai-config sync` to synchronize all principles"));
    } else if (validationResult.includes("✅")) {
      log.success(kleur.green("All principles are synchronized!"));
    }
  }

  // Summary
  console.log();
  if (configuredTools.length > 0) {
    log.success(`Configured: ${configuredTools.join(", ")}`);

    // Show next steps
    console.log();
    log.info(kleur.bold("Next steps:"));
    log.info(kleur.dim("  • Run `ai-config validate` to check sync status"));
    log.info(kleur.dim("  • Run `ai-config sync` to sync principles"));
    log.info(kleur.dim("  • Add `ai-config` to your PATH for easy access"));
  } else {
    log.info("No tools configured");
  }

  outro(kleur.gradient.cristal("Setup complete!"));
}

// Run the setup
main().catch((error) => {
  log.error(kleur.red("Setup failed:"));
  log.error(kleur.red(error.message));
  process.exit(1);
});
