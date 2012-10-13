$(call inherit-product, device/sony/lotus/full_lotus.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ST27i_1262-1120 BUILD_FINGERPRINT=SEMC/ST27i_1262-1120/ST27i:4.0.4/6.1.1.B.1.10/9bt3zw:user/release-keys PRIVATE_BUILD_DESC="ST27i-user 4.0.4 6.1.1.B.1.10 9bt3zw test-keys"

TARGET_BOOTANIMATION_NAME := vertical-320x480

PRODUCT_NAME := cm_lotus
PRODUCT_DEVICE := lotus
