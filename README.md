# **Finn’s Quest: A GBA Side-Scroller Adventure**

Welcome to **Finn’s Quest**, a side-scrolling action-platformer for the Game Boy Advance (GBA), starring a sword-wielding hero battling through parallax-scrolling levels with magic fireballs, deadly enemies, and powerups to aid your journey.

---

## 🎮 **Game Overview**

**Finn’s Quest** is a two-level adventure game featuring:
- Smooth **player movement**, jumping, and animated sprites
- **Destructible terrain** with fireball mechanics
- **Two enemy types**: Marceline (Level 1) and Knight (Level 2), each with animations and behavior
- **Powerups** that grant temporary invincibility
- **Background music** and sound effects
- **Level progression**, win/lose states, and start/pause screens

---

## 🛠️ **Project Structure**

| File | Description |
|------|-------------|
| `main.c` | Contains the main game logic, including state management, gameplay, collisions, animations, and rendering |
| `mode0.h`, `mode4.h` | Handle graphics modes and rendering (Mode 0 and Mode 4) |
| `gba.h` | Hardware registers and macros for interacting with GBA memory and input |
| `sprites.h`, `finnSpriteSheet.h` | Sprite handling and frame animations |
| `background.h`, `foreground.h`, `foreground2.h`, etc. | Background/foreground tilemaps |
| `sound.c/.h` | Audio playback system with two sound channels |
| `instructions.h`, `start1.h`, `start2.h`, `lose.h`, `win.h`, `pause.h` | Mode 4 images for screen transitions |
| `level1.h`, `level2.h` | Level-specific tilemaps and collision maps |
| `fireballSoundEffect.h`, `finn_scream.h`, `backgroundMusic.h`, etc. | Audio data |

---

## 🧠 **Core Gameplay Features**

### 🔥 Fireballs & Tile Destruction
- Press **B** to shoot a fireball.
- Fireballs **destroy destructible tiles** and damage enemies.
- Each tile is tracked and replaced in VRAM on hit.

### 🧟 Enemies
- Enemies patrol left/right.
- Getting too close damages the player unless invincible.
- When hit, enemies are **stunned** and then eliminated after their health drops to zero.

### 💥 Powerups
- Powerups grant **temporary invincibility**.
- Only active powerups are drawn and interactable.

### 🎵 Music & Sound
- Plays background music and melodic notes at intervals.
- Uses both DMA sound channels.

---

## 🕹️ **Controls**

| Button         | Action                                       |
|----------------|----------------------------------------------|
| **START**      | Advance screens / Pause / Unpause game       |
| **SELECT**     | Instantly trigger Game Over                  |
| **A**          | Jump (when on the ground)                    |
| **B**          | Shoot fireball                               |
| **LEFT / RIGHT** | Move player left or right                   |
| **R (Right Shoulder)** | Activate **invincibility cheat** (permanent) |
| **L (Left Shoulder)** | *Reserved / unused* (customizable)     |

---

## 📺 **Graphics & Backgrounds**
- Mode 0: Used for in-game scrolling foreground/background
- Mode 4: Used for splash screens (start, instructions, pause, lose, win)
- **Parallax scrolling** is applied to backgrounds for visual depth.

---

## 🔄 **Game States**

- `START` → `START2` → `INSTRUCTIONS` → `GAME`
- `GAME` → `PAUSE` / `LOSE` / `WIN`
- `LEVEL 1` → `LEVEL 2` → `WIN`

---


## ✅ **To Do / Potential Expansions**

- More powerups (double jump, speed boost, etc.)
- Boss battle in level 2
- Save/load system
- Enhanced UI for player health
- Dialogue system or story screen

---

## 👏 Credits

- Sprites & tilesheets: Custom / adapted
- Sound effects: GBA-compatible `.wav` data
- Programming: Akash Jain
- Engine Framework: Based on GBA Mode 0/Mode 4 programming practices from TONC & class templates
