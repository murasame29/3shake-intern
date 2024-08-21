# 3shake-intern

## dir構成について
```
.
├── README.md
├── infra                                   # インフラに関するdir
│   └── studio                              # feature毎に作る
│       ├── dev                             # 各環境毎にmain.tfを作る
│       └── module                          # resourcesをmodule化してまとめる
└── manifests                               # k8sのmanifestに関するdir
    └── samples                             # アプリケーションが所属する ns
        └── sample-app                      # アプリケーション名のdir
            ├── base                        # 環境毎の基礎になるmanifest
            │   └── kustomization.yaml
            └── overlays                    # 環境毎のadditional manifest
                └── dev                    
                    └── kustomization.yaml
```


