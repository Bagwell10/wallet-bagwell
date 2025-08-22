
----------------------------------------------------------------------
---                                                                ---
---    /|    //| |                                                 ---
---   //|   // | |     ___             ( )  _   __      ___        ---
---  // |  //  | |   //   ) ) \\ / /  / / // ) )  ) ) //___) )     ---
--- //  | //   | |  //   / /   \/ /  / / // / /  / / //            ---
---//   |//    | | ((___( (    / /\ / / // / /  / / ((____         ---
---                                                                ---
----------------------------------------------------------------------

---Copyright :)---

---Par Maxime Pour Tout Serveur Compatible Avec Darkrp !---




if SERVER then util.AddNetworkString( "OpenWalletMenuCmd" ) end AddCSLuaFile()

SWEP.PrintName = "Porte monnaie"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Author = ""
SWEP.Instructions = ""
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPPocket = false

SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix  = "normal"
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Porte-Monnaie | Bagwell Teams"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:Deploy()
    if SERVER then return
    end
    return true
end

function SWEP:DrawWorldModel() end

function SWEP:PreDrawViewModel(vm)
    return true
end


function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(0.6)
	if (!SERVER) then return end
	net.Start("OpenWalletMenuCmd")
	net.Send(self.Owner)
end

function SWEP:SecondaryAttack()
return true
end

function SWEP:Holster()
    if not SERVER then return true end

    self:GetOwner():DrawViewModel(true)
    self:GetOwner():DrawWorldModel(true)

    return true
end