# Sealed Secrets Controller

Sealed Secrets is a secret management tool made by `Bitnami`. It encrypts secrets in a way that cannot be decrypted by an operator but only by the Sealed Secrets Controller, which also encrypted the same secret before.

## Prerequisites

- [kubeseal](https://github.com/bitnami-labs/sealed-secrets/releases)
- [sealed-secrets installation](https://github.com/bitnami-labs/sealed-secrets#installation)

## Usage

### Step 1: Create a basic Secret

For example, use the secret located at `base/tests/test-secret.yml`. Its content:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: test-secret
type: Opaque
data:
  secretKey: c29tZSBoYXJkY29yZSBwYXNzd29yZA==
```

### Step 2: Encode the Secret using Kubeseal

Run this command to encode the secret:
```console
$ kubeseal < base/test-secret.yml > base/sealed-test-secret.json
...
```

Then, the `base/tests/sealed-test-secret.json` will appear. Its content (may vary):
```json
{
  "kind": "SealedSecret",
  "apiVersion": "bitnami.com/v1alpha1",
  "metadata": {
    "name": "test-secret",
    "namespace": "default"
  },
  "spec": {
    "template": {
      "metadata": {
        "name": "test-secret",
        "namespace": "default"
      },
      "type": "Opaque"
    },
    "encryptedData": {
      "secretKey": "AgBGYgX1G9j0o5jQ2vgaZsRFfd7nMvwXEujqOPAkudHlyGDZVZZP5vvZNbnb5t0JqJ6uPF8VGhwtX63pkkddAA1DO2PnqJmjA+Z+907tZ1m2HCLXKPI3+Pl0TQUcveFTp54XE/mK9i61cOxXAGKn6e5r8+qC57rIThjcaB/ZyITdiDoFKm+MwkXqAqf8SoggBbgO3agKhutxw6HStecDBkDZNVQZRKicc/g1+dsmhmI/IuSt9uxoA4eU10LdF2tTj/78PoQZFjEo575owz1ZQ9Q3nXDWBWD5ycfBfrP0dPy/yXXAIrwYkeKKEQccpz+Rkuf+ope5FvgQGN4SObavYgkTSwnQj8+RwvTk7cfDLkeOuQnjNcCz5mPyyCZgWr7G95WOWel5NNMklQKtO8MfwTs/46oUSwTayl6QUbElWGTDFY7+WHENRszVNn+v2NrHNY/Wp8X93HBi4ONCarZ73dGGg+WiBMT+XAZqi+Hgfw1ob3ANKQ4H241L4yW/1YYMjd8/riVm2wVQLdx6MGd6uJi6SLL0I1fglivR8yL754VTexMAF4xaAho+o6L1UyZudmOYeK5H0A/gVYpuUqjiI6Y4lBSpiFmth0Q4tN8diiF198nd1bem/TTwGdxkHDiokKrJjYg1mWkgeMVADupAjPUXHcC0d1C+6f/RFP3yUHHNZaUSQUHRRzZtsm9bZEcJObJDJ/vFAAK7LL3tEbt755+XoF3IQ3cj"
    }
  }
}
```

### Step 3

Voilà. This secret can now be made public anywhere since it cannot be decrypted by anyone except for the sealed-secrets-controller. Don't forget to delete your Kubernetes secret file afterwards (NOT THE SECRET ITSELF).
