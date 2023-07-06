import { ShellCommand, BrewPackage, BrewPackageOptions, GitConfig, GitRepo } from "@vaibhavvenkat/aacod"
import { casks, cmds, defaults, formulas, other_tools } from "./data"
import * as readline from "readline"

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
})

async function main() {
    console.log("Setting up the mac...")
    for (const cmd of cmds) {
        const res = await new ShellCommand(cmd).safeRun()
        if (res.success) {
            console.log(cmd.success_msg)
        } else {
            console.error(cmd.error_msg)
            console.error(res.error)
        }
    }
    for (let i = 0; i < casks.length; i++) {
        const cask = casks[i]
        const cask_opt: BrewPackageOptions = {
            name: cask.name,
            silent: false,
            cask: true,
            update_homebrew: i === 0,
            upgrade_all: false,
        }
        const res = await new BrewPackage(cask_opt).safeInstall()
        if (res.success) {
            console.log(`${cask.name} installed successfully!`)
        } else {
            console.error(`${cask.name} installation failed!`)
            console.error(res.error)
        }
    }

    for (let i = 0; i < formulas.length; i++) {
        const formula = formulas[i]
        const formula_opt: BrewPackageOptions = {
            name: formula.name,
            silent: false,
            cask: false,
            update_homebrew: i === formulas.length - 1,
            upgrade_all: false,
        }
        const res = await new BrewPackage(formula_opt).safeInstall()
        if (res.success) {
            console.log(`${formula.name} installed successfully!`)
        } else {
            console.error(`${formula.name} installation failed!`)
            console.error(res.error)
        }
    }
    console.log("Starting git config")
    const name = await new Promise(resolve => {
        rl.question("What is your git user name? ", resolve)
    })
    const email = await new Promise(resolve => {
        rl.question("What is your git email? ", resolve)
    })
    const config = new GitConfig({
        name: name as string,
        silent: false,
    })
    const email_config = new GitConfig({
        name: email as string,
        silent: false,
    })
    const name_res = await config.safeSet()
    const email_res = await email_config.safeSet()
    if (!name_res.success || !email_res.success) {
        console.error("Git config failed!")
        console.error(name_res.error)
        console.error(email_res.error)
    } else {
        console.log("Git config done!")
    }

    for (const default_cmd of defaults) {
        const res = await new ShellCommand({
            command: default_cmd,
            silent: false,
        }).safeRun()
        if (res.success) {
            console.log(`${default_cmd} done!`)
        } else {
            console.error(`${default_cmd} failed!`)
            console.error(res.error)
        }
    }
    console.log("Cloning dotfiles...")
    const git_res = await new GitRepo({
        repo: "git@github.com/vibovenkat123/.dotfiles.git",
        silent: false,
        bare: true,
        dest: `${process.env.HOME}/.dotfiles`,
    }).safeClone()
    if (git_res.success) {
        console.log("Dotfiles cloned successfully!")
    } else {
        console.error("Dotfiles clone failed!")
        console.error(git_res.error)
    }
    console.log("Installing other tools")
    for (const other_tool of other_tools) {
        const res = await new ShellCommand({
            command: other_tool,
            silent: false,
        }).safeRun()
        if (res.success) {
            console.log(`${other_tool} installed successfully!`)
        } else {
            console.error(`${other_tool} installation failed!`)
            console.error(res.error)
        }
    }
    console.log("Done!")
}

main()
