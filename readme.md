## Quake log parser and report generator
### Description
This project was created with the objective of gathering information of Quake matches from its log file.
There are some reports in JSON format implemented to display kills by player and deaths by types.
Examples of reports:

Game:
``` json
{
    "game_37": {
        "total_kill": 131,
        "players": [
          "Dono da Bola",
          "Isgalamido",
          "Zeh",
          "Oootsimo",
          "Mal",
          "Assasinu Credi"
        ],
        "kills": {
          "Oootsimo": {
            "kills": "22",
            "deaths": "18"
          },
          "Assasinu Credi": {
            "kills": "19",
            "deaths": "30"
          },
          "Zeh": {
            "kills": "19",
            "deaths": "15"
          },
          "Isgalamido": {
            "kills": "17",
            "deaths": "19"
          },
          "Dono da Bola": {
            "kills": "14",
            "deaths": "19"
          },
          "Mal": {
            "kills": "6",
            "deaths": "30"
          }
        },
        "most_kills": "Oootsimo",
        "most_deaths": "Mal"
      }
    }
}
```

Means of death
``` json
{
    "game_37": {
        "MOD_ROCKET_SPLASH": 60,
        "MOD_ROCKET": 37,
        "MOD_TRIGGER_HURT": 14,
        "MOD_RAILGUN": 9,
        "MOD_SHOTGUN": 4,
        "MOD_MACHINEGUN": 4,
        "MOD_FALLING": 3
    }
}
```

### Instructions for running the project

- Install dependencies with bundler
- To create a report for means of death:
``` bash
ruby src/means_of_death.rb qgames.log
```
- To create games report

``` bash
ruby src/report.rb qgames.log      
```
