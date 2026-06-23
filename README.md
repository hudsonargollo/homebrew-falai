# homebrew-falai

Homebrew tap for [**FalaAí**](https://falai.tektone.com.br/) — ditado por voz offline, em qualquer app.

## Instalar

```sh
brew install --cask hudsonargollo/falai/falai
```

ou:

```sh
brew tap hudsonargollo/falai
brew install --cask falai
```

A instalação remove automaticamente a quarentena do macOS (o app é assinado
ad-hoc, ainda não notarizado), então o FalaAí abre direto — sem o erro
"aplicativo danificado" e sem precisar do Terminal.

## Atualizar

```sh
brew upgrade --cask falai
```

## Desinstalar

```sh
brew uninstall --cask falai          # remove o app
brew uninstall --zap --cask falai    # remove o app + dados/configurações
```
