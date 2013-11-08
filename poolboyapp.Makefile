ERL = erl
REBAR = rebar
APP := {{ appid }}
DIALYZER = dialyzer

.PHONY: all compile test clean get-deps build-plt dialyze

all: deps
	@$(REBAR) compile

deps:
	@$(REBAR) get-deps

test: all
	@$(REBAR) skip_deps=true eunit

clean:
	@$(REBAR) clean

distclean: clean
	@$(REBAR) delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

.dialyzer_plt:
	@$(DIALYZER) --build_plt --output_plt .dialyzer_plt \
            --apps kernel stdlib

build-plt: .dialyzer_plt

dialyze: build-plt
	@$(DIALYZER) --src src --plt .dialyzer_plt $(DIALYZER_WARNINGS)
