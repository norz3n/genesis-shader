// Genesis Shader Code
//
// By Victor (or vellyn-production)
//
// Thanks

// Config including
#include "genesis_shd.conf" // Global Config
#include "genesis_shd_adv.conf" // Advanced Config

// Depth or Z-Buffer
const float4 FarСolor = 0.0; // Far Objects 

const float4 NearСolor = 1.0; // Near Objects

const float ClearDepth = 1.0; // Default Depth Variable

const int ClearStencil = 0.0; // Stencil

// Controller Variables
bool _GlobalVolumeSetting : CONTROLOBJECT<string name = "genesis_controller.pmx";>; // Global Shader Controller

// Controller - Sun Light Intensity
float mSunLightIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunLightInt+";>;

float mSunLightIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunLightInt-";>;

// Controller - Sun Shadow
float mSunShadowRed_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunShadowIntR+";>;

float mSunShadowGreen_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunShadowIntG+";>;

float mSunShadowBlue_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunShadowIntB+";>;

float mSunShadowContrast_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunContInt-";>;

// Controller - Sun Temperature
float mSunTempIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunTempInt+";>;

float mSunTempIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SunTempInt-";>;

// Controller - Horizon Based Ambient Occlusion
float mHBAO_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "HBAOInt+";>;

float mHBAO_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "HBAOInt-";>;

float mHBAORadius_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "HBAORadiusInt+";>;

float mHBAORadius_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "HBAORadiusInt-";>;

// Controller - Screen Space Subsurface Scattering
float mSSSS_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SSSSInt+";>;

float mSSSS_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SSSSInt-";>;

// Controller - Exposure
float mExposureIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "ExposureInt+";>;

float mExposureIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "ExposureInt-";>;

// Controller - Vignette
float mVignette : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "Vignette";>;

// Controller - Dispersion
float mDispersion : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "Dispersion";>;

float mDispersionRadius : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "DispersionRadius";>;

// Controller - Contrast
float mContrastIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "ContrastInt+";>;

float mContrastIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "ContrastInt-";>;

// Controller - Saturation
float mSaturationIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SaturationInt+";>;

float mSaturationIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "SaturationInt-";>;

// Controller - Vibrance
float mVibranceIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "VibranceInt+";>;

float mVibranceIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "VibranceInt-";>;

// Controller - Gamma
float mGammaIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "GammaInt+";>;

float mGammaIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "GammaInt-";>;

// Controller - Color Balance
float mColorBalanceIntesityRed_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "BalanceIntR+";>;

float mColorBalanceIntesityGreen_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "BalanceIntG+";>;

float mColorBalanceIntesityBlue_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "BalanceIntB+";>;

float mColorBalanceIntesityRed_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "BalanceIntR-";>;

float mColorBalanceIntesityGreen_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "BalanceIntG-";>;

float mColorBalanceIntesityBlue_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "BalanceIntB-";>;

// Controller - Temperature
float mTemperatureIntensity_P : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "TemperatureInt+";>;

float mTemperatureIntensity_M : CONTROLOBJECT<string name="genesis_controller.pmx"; string item = "TemperatureInt-";>;

static float mSunLightIntensity = lerp(lerp(mLightIntensityMin, mLightIntensityMax, mSunLightIntensity_P), 0, mSunLightIntensity_M);