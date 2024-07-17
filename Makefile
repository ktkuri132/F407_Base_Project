##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [4.3.0-B58] date: [Wed Jul 17 15:59:56 CST 2024]
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = make_obj


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# ASM sources
ASM_SOURCES =  \
startup_stm32f407xx.s

# ASM sources
ASMM_SOURCES = 

# C sources
C_SOURCES =  \
User/main.c \
User/stm32f4xx_it.c \
User/system_stm32f4xx.c \
STM32F4xx_LIB/periph/src/stm32f4xx_adc.c \
STM32F4xx_LIB/periph/src/stm32f4xx_can.c \
STM32F4xx_LIB/periph/src/stm32f4xx_cec.c \
STM32F4xx_LIB/periph/src/stm32f4xx_crc.c \
STM32F4xx_LIB/periph/src/stm32f4xx_cryp_aes.c \
STM32F4xx_LIB/periph/src/stm32f4xx_cryp_des.c \
STM32F4xx_LIB/periph/src/stm32f4xx_cryp_tdes.c \
STM32F4xx_LIB/periph/src/stm32f4xx_cryp.c \
STM32F4xx_LIB/periph/src/stm32f4xx_dac.c \
STM32F4xx_LIB/periph/src/stm32f4xx_dbgmcu.c \
STM32F4xx_LIB/periph/src/stm32f4xx_dcmi.c \
STM32F4xx_LIB/periph/src/stm32f4xx_dma2d.c \
STM32F4xx_LIB/periph/src/stm32f4xx_dsi.c \
STM32F4xx_LIB/periph/src/stm32f4xx_exti.c \
STM32F4xx_LIB/periph/src/stm32f4xx_flash_ramfunc.c \
STM32F4xx_LIB/periph/src/stm32f4xx_flash.c \
STM32F4xx_LIB/periph/src/stm32f4xx_gpio.c \
STM32F4xx_LIB/periph/src/stm32f4xx_hash_md5.c \
STM32F4xx_LIB/periph/src/stm32f4xx_hash_sha1.c \
STM32F4xx_LIB/periph/src/stm32f4xx_hash.c \
STM32F4xx_LIB/periph/src/stm32f4xx_i2c.c \
STM32F4xx_LIB/periph/src/stm32f4xx_iwdg.c \
STM32F4xx_LIB/periph/src/stm32f4xx_lptim.c \
STM32F4xx_LIB/periph/src/stm32f4xx_ltdc.c \
STM32F4xx_LIB/periph/src/stm32f4xx_pwr.c \
STM32F4xx_LIB/periph/src/stm32f4xx_qspi.c \
STM32F4xx_LIB/periph/src/stm32f4xx_rcc.c \
STM32F4xx_LIB/periph/src/stm32f4xx_rng.c \
STM32F4xx_LIB/periph/src/stm32f4xx_rtc.c \
STM32F4xx_LIB/periph/src/stm32f4xx_sai.c \
STM32F4xx_LIB/periph/src/stm32f4xx_sdio.c \
STM32F4xx_LIB/periph/src/stm32f4xx_spdifrx.c \
STM32F4xx_LIB/periph/src/stm32f4xx_spi.c \
STM32F4xx_LIB/periph/src/stm32f4xx_syscfg.c \
STM32F4xx_LIB/periph/src/stm32f4xx_tim.c \
STM32F4xx_LIB/periph/src/stm32f4xx_usart.c \
STM32F4xx_LIB/periph/src/stm32f4xx_wwdg.c 


# C includes
C_INCLUDES =  \
-IUser \
-ISTM32F4xx_LIB/core \
-ISTM32F4xx_LIB/periph/inc 

# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_STDPERIPH_DRIVER \
-DSTM32F407xx

#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32F407ZGTx_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASMM_SOURCES:.S=.o)))
vpath %.S $(sort $(dir $(ASMM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@
$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***