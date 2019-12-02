---
title: PHP - PHPCS
---

@see phpmd--.md

phpcs --config-set default_standard KingKludge

```
phpcs --extensions=php DistributionPackages/Visol.JungfrauReports --report=diff
```

To automatically fixed, execute `phpcbf`

```bash
phpcbf --extensions=php DistributionPackages/Visol.JungfrauReports
```
