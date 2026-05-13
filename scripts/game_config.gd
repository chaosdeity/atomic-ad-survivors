extends RefCounted

const VIEWPORT_SIZE := Vector2(480, 270)
const ARENA_HALF := Vector2(760, 430)

const AD_PAPER := Color("#f5e9d0")
const PASTEL_BEIGE := Color("#e8c8a0")
const MINT_FADE := Color("#c8dcd8")
const CORAL_PINK := Color("#f2b8b0")
const LEMON_YELLOW := Color("#fad89c")
const SAGE_GREEN := Color("#a8c8b8")
const COCOA := Color("#7a4a3a")
const INK := Color("#2a2a28")
const TOXIC_GREEN := Color("#9fff5c")
const NEON_RED := Color("#ff4d5c")
const VITAMIN_YELLOW := Color("#ffe93f")

const PLAYER_SPEED := 118.0
const PLAYER_RADIUS := 10.0
const PLAYER_MAX_HP := 100.0
const BASE_DPS := 100.0
const AUTO_RANGE := 155.0
const AUTO_TICK := 0.12

const ENEMY_HP := 30.0
const ELITE_HP := 90.0
const ENEMY_SPEED := 36.0
const ELITE_SPEED := 25.0
const ENEMY_CONTACT_DPS := 10.5
const ENEMY_CAP := 150

const CHARGE_PERIOD := 5.0
const CHARGE_WINDOW := 1.0
const CHARGE_WARNING_TIME := 0.6
const CHARGE_DAMAGE := BASE_DPS * CHARGE_WINDOW * 2.5
const CHARGE_AOE_TARGETS := 15
const DIRECTED_BONUS := 1.6
const DIRECTED_AOE_TARGETS := 22
const CHARGE_RANGE := 210.0
const DIRECTED_ARC_COS := 0.55
const CHARGE_AIM_DEADZONE := 18.0
const CHARGE_READY_FLASH := 0.16
const CHARGE_MISS_FLASH := 0.09
const CHARGE_NORMAL_SHAKE := 4.3
const CHARGE_FOCUS_SHAKE := 7.4
const CHARGE_MAX_PARTICLES := 180
const PARTICLE_GRAVITY := Vector2(0, 34)
