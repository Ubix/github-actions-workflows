# github-actions-workflows

## Promote

The promote workflow consists of 2 job types, build which can vary depending on the application and update the env which uses the `promote-update-tag.yml`

### Usage

The promote workflow can be manually triggered on the application repos by `Actions -> Promote -> Run workflow` and filling up the inputs.
- Backoffice Applications:
    1. `Environment to promote to` - Selects either stg or prd to update the application in.
- Cloudspace Applications:
    1. `Environment to promote to` - Selects dev, stg or prd to update the application.
    2. `Cloudspace account to promote to` [optional] - Selects which cloudspace account to update, if not filled will update all accounts on the selected env.

### Adding Promote to a repo/branch

You can use as reference any workflow from `Examples` section.

Promote workflow lives in the repos as `.github/workflows/promote.yml` and is configured as follows:

- Inputs
    |                    | type          | required| application              |
    | -------------      |:-------------:|:-------:|:------------------------:|
    | environment        | choice        | true    | backoffice and cloudspace|
    | cloudspace_account | string        | false   | cloudspace               |

