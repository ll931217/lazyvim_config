local configs = {}
local js_languages = {
  "javascript",
  "typescript",
}

for _, language in ipairs(js_languages) do
  configs[language] = {
    {
      name = "Launch Leap Dev",
      type = "pwa-node",
      request = "launch",
      cwd = "${workspaceFolder}",
      rootPath = "${workspaceFolder}",
      protocol = "inspector",
      console = "integratedTerminal",
      runtimeExecutable = "pnpm",
      runtimeArgs = {
        "run-script",
        "dev",
      },
      skipFiles = {
        "<node_internals>/**",
      },
      -- outFiles = {
      --   "${workspaceFolder}/**/*.ts",
      --   "!**/node_modules/**",
      -- },
    },
    {
      name = "Launch Leap Dev (Local DB)",
      type = "pwa-node",
      request = "launch",
      cwd = "${workspaceFolder}",
      protocol = "inspector",
      console = "integratedTerminal",
      runtimeExecutable = "pnpm",
      runtimeArgs = {
        "run",
        "dev:local",
      },
      skipFiles = {
        "<node_internals>/**",
      },
    },
    {
      name = "Launch Leap Dev (Staging DB)",
      type = "pwa-node",
      request = "launch",
      cwd = "${workspaceFolder}",
      rootPath = "${workspaceFolder}",
      protocol = "inspector",
      console = "integratedTerminal",
      runtimeExecutable = "pnpm",
      runtimeArgs = {
        "run-script",
        "dev",
      },
      skipFiles = {
        "<node_internals>/**",
      },
      env = {
        DB_HOST = "leap-staging.cprc5ppsmxds.ap-northeast-1.rds.amazonaws.com",
        DB_NAME = "leapdev",
      },
    },
    {
      name = "Launch Leap Dev (Production DB)",
      type = "pwa-node",
      request = "launch",
      cwd = "${workspaceFolder}",
      rootPath = "${workspaceFolder}",
      protocol = "inspector",
      console = "integratedTerminal",
      runtimeExecutable = "pnpm",
      runtimeArgs = {
        "run-script",
        "dev",
      },
      skipFiles = {
        "<node_internals>/**",
      },
      env = {
        DB_HOST = "leap-prod.cprc5ppsmxds.ap-northeast-1.rds.amazonaws.com",
        DB_NAME = "leap",
        DB_PASSWORD = os.getenv("DB_PROD_PASSWORD"),
      },
    },
  }
end

return configs
