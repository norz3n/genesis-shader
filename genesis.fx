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


// Shader Calculation
static float mSunLightIntensity = lerp(lerp(mLightIntensityMin, mLightIntensityMax, mSunLightIntensity_P), 0, mSunLightIntensity_M); // Sun Light Intensity

static float mSunTempIntensity = lerp(lerp(6600, 40000, mSunTempIntensity_P), 1000, mSunTempIntensity_M); // Sun Temperature Intensity

static float mHBAOPRadius = lerp(lerp(20.0, mHBAOPMaxRadius, mHBAORadius_P), mHBAOPMinRadius, mHBAORadius_M); // HBAO+ Radius

static float mHBAOPIntensity = lerp(lerp(5, mHBAOPIntensityMin, mHBAO_P), mHBAOPIntensityMax, mHBAO_M); // HBAO+ Intensity

static float mSSSSScale = lerp(lerp(0.08, mSSSSIntensityMax, mSSSS_P), mSSSSIntensityMin, mSSSS_M); // SSSS Scale

static float mExposureIntensity = lerp(lerp(1.0, mExposureIntensityMax, mExposureIntensity_P), mExposureIntensityMin, mExposureIntensity_M); // Exposure Intensity

static float mColorContrastIntensity = lerp(lerp(1, 2, mContrastIntensity_P), 0.5, mContrastIntensity_M); // Contrast Intensity

static float mColorSaturationIntensity = lerp(lerp(1, 2, mSaturationIntensity_P), 0.0, mSaturationIntensity_M); // Saturation Intensity

static float mColorVibranceIntensity = lerp(lerp(0, 1, mVibranceIntensity_P), 0.0, mVibranceIntensity_M); // Vibrance Intensity

static float mColorGammaIntensity = lerp(lerp(1.0, 2.2, mGammaIntensity_P), 0.45, mGammaIntensity_M); // Gamma Intensity

static float mTemperatureIntensity = lerp(lerp(mTemperature, 1000, mTemperatureIntensity_P), 40000, mTemperatureIntensity_M); // Color Temperature

static float3 mSunShadowColor = pow(float3(mSunShadowRed_P, mSunShadowGreen_P, mSunShadowBlue_P), 2); // Sun Shadow Color

static float3 mColorBalanceIntesity_P = float3(mColorBalanceIntesityRed_P, mColorBalanceIntesityGreen_P, mColorBalanceIntesityBlue_P); // Color Balance Plus Intensity

static float3 mColorBalanceIntesity_M = float3(mColorBalanceIntesityRed_M, mColorBalanceIntesityGreen_M, mColorBalanceIntesityBlue_M); // Color Balance Minus Intensity

// Including Modules
#include "Shader/Kernel/math.fxsub" // Mathematics functions

#include "Shader/Kernel/common.fxsub" // Config Variable Settings

#include "Shader/Kernel/textures.fxsub" // MikuMikuEffect Tabs & Default Effect Loader

#include "Shader/Kernel/Color.fxsub"
#include "Shader/Kernel/Packing.fxsub"
#include "Shader/Kernel/gbuffer.fxsub"
#include "Shader/Kernel/BRDF.fxsub"
#include "Shader/Kernel/ACES.fxsub"
#include "Shader/Kernel/ColorGrading.fxsub"
#include "shader/Kernel/VolumeRendering.fxsub"
#include "shader/Kernel/ScreenSpaceEffects/ScreenSpaceLighting.fxsub"
#include "shader/Kernel/Shadow.fxsub"
#include "shader/Kernel/MonteCarlo.fxsub"
#include "shader/Kernel/Poisson.fxsub"