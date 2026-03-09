# Dodge!

A simple dodge game made in Godot 4.2. Avoid the falling rocks for as long as you can.

## How to Play

Use **A/D** or **Arrow Keys** to move left and right. Don't get hit by the rocks.

The longer you survive, the higher your score. Things speed up over time so good luck.

## Controls

| Key | Action |
|-----|--------|
| A / Left Arrow | Move left |
| D / Right Arrow | Move right |
| Space | Restart after game over |

## Running the Game

1. Open Godot 4.2+
2. Import this project
3. Hit play

Or just download a build from the releases page if there is one.

## Project Structure

```
dodge_game/
├── main.tscn        # main scene, spawns rocks and handles game state
├── main.gd          # game logic, scoring, difficulty scaling
├── player.tscn      # the little green square you control
├── player.gd        # movement and screen clamping
├── rock.tscn        # the falling obstacles
├── rock.gd          # fall behavior and collision detection
├── project.godot    # project settings
└── icon.svg         # app icon
```

## License

Do whatever you want with this. MIT or public domain, your pick.
