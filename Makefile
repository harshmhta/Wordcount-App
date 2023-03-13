TARGET = wordcount
TARGET_SANITIZE = wordcount_sanitize
STUDENT_OBJS += helper.o
OBJS += $(STUDENT_OBJS)
OBJS += driver.o
OBJS += que.o
OBJS += buffer.o
LIBS += -lpthread
LIBS += -lrt
LIBS += -lm



W204_CC = /home/software/gcc/gcc-6.3.0/bin/gcc630
ifeq ("$(wildcard $(W204_CC))","")
	CC = gcc
else
	CC = $(W204_CC)
endif

CFLAGS += -MMD -MP # dependency tracking flags
CFLAGS += -I./
CFLAGS += -std=gnu99 -Wall #-Werror 
LDFLAGS += -L.
LDFLAGS += $(LIBS)

NOT_ALLOWED += -Dsleep=sleep_not_allowed
NOT_ALLOWED += -Dusleep=usleep_not_allowed
NOT_ALLOWED += -Dnanosleep=nanosleep_not_allowed
NOT_ALLOWED += -Dselect=select_not_allowed

all: CFLAGS += -g -O2 # release flags
all: $(TARGET) $(TARGET_SANITIZE)

release: clean all

debug: CFLAGS += -g -O0 -D_GLIBC_DEBUG # debug flags
debug: clean $(TARGET) $(TARGET_SANITIZE)

SANITIZE_OBJS = $(OBJS:%.o=%_sanitize.o)
$(TARGET_SANITIZE): $(SANITIZE_OBJS)
	$(CC) $(CFLAGS) -fsanitize=thread -o $@ $^ $(LDFLAGS) -static-libtsan

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(STUDENT_OBJS:%.o=%_sanitize.o): CFLAGS += $(NOT_ALLOWED)
%_sanitize.o: %.c
	$(CC) $(CFLAGS) -fPIC -fsanitize=thread -c -o $@ $<

$(STUDENT_OBJS): CFLAGS += $(NOT_ALLOWED)
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

ALL_OBJS = $(OBJS) + $(SANITIZE_OBJS)
DEPS = $(ALL_OBJS:%.o=%.d)
-include $(DEPS)

clean:
	-@rm $(TARGET) $(TARGET_SANITIZE) $(ALL_OBJS) $(DEPS) 2> /dev/null || true
	-@rm output.txt testoutput.txt 2> /dev/null || true
	-@rm tmp*.txt 2> /dev/null || true
	-@rm error_*.log 2> /dev/null || true
