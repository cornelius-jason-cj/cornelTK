OBJS    = $(patsubst %.c,%.o,$(shell ls *.c))
HEADERS = $(wildcard *.h)

all: out $(OBJS)

out:
	@echo "Building: Shared source"

%.o: %.c $(HEADERS) Makefile
	@echo "  Compile: $<"
	@$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@rm -f $(OBJS)
