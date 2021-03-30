#!/usr/bin/env -S deno run --allow-env --allow-read --allow-write --allow-run --unstable

import {
  ensureDirSync,
  ensureSymlinkSync,
  moveSync,
} from "https://deno.land/std@0.91.0/fs/mod.ts";

const HOME = Deno.env.get("HOME") as string;
const CWD = Deno.cwd();
const DOTFILES = `${HOME}/.dotfiles`;
const IGNORED = [".git", "dotfiles.ts", "__pycache__", ".gitignore"];

const install = () => {
  console.log("Creating symlinks");
  for (const file of listFiles(DOTFILES)) {
    console.log(`${HOME}/${file}`);
    ensureSymlinkSync(`${DOTFILES}/${file}`, `${HOME}/${file}`);
  }
};

const listFiles = (
  basePath: string,
  subPath: string | null = null
): string[] => {
  const fullPath = subPath ? `${basePath}/${subPath}` : basePath;
  const files = [];
  for (const file of Deno.readDirSync(fullPath)) {
    const filePath = subPath ? `${subPath}/${file.name}` : file.name;
    if (!IGNORED.includes(file.name)) {
      if (file.isDirectory) {
        files.push(...listFiles(basePath, filePath));
      } else {
        files.push(filePath);
      }
    }
  }
  return files;
};

const addPaths = (...paths: string[]): void => {
  paths.forEach((path) => {
    const subPath = getSubPath(path);
    const fullPath = `${CWD}/${subPath}`;
    if (Deno.statSync(fullPath).isDirectory) {
      for (const file of Deno.readDirSync(fullPath)) {
        addPaths(`${fullPath}/${file.name}`);
      }
    } else {
      addFile(subPath);
    }
  });
};

const getSubPath = (path: string): string => {
  let subPath;
  if (path[0] === "/") {
    if (!path.startsWith(HOME)) {
      console.error(`Cannot add files outside of ${HOME}`);
    }
    subPath = path.slice(HOME.length + 1);
  } else if (path.slice(0, 2) === "~/") {
    subPath = `${path.slice(2)}`;
  } else {
    const fullPath = `${CWD}/${path}`;
    console.log(fullPath);
    if (!fullPath.startsWith(HOME)) {
      console.error(`Cannot add files outside of ${HOME}`);
    }
    subPath = fullPath.slice(HOME.length + 1);
  }
  return subPath;
};

const addFile = (path: string): void => {
  if (path === "/.fehbg") {
    Deno.exit();
  }
  const subPath = getSubPath(path);

  const destinationPath = `${DOTFILES}/${subPath}`;
  const destinationParent = destinationPath.split("/").slice(0, -1).join("/");
  console.log(`Adding file ${path}`);
  ensureDirSync(destinationParent);
  moveSync(`${HOME}/${subPath}`, `${DOTFILES}/${subPath}`, { overwrite: true });
  ensureSymlinkSync(`${DOTFILES}/${subPath}`, `${HOME}/${subPath}`);
};

if (import.meta.main) {
  let [command, ...args] = Deno.args;

  switch (command) {
    case "install": {
      install();
      break;
    }
    case "add": {
      let [path] = args;
      addPaths(path);
      break;
    }
  }
}
