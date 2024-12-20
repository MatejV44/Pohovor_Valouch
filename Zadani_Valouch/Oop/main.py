# Základní třída pro HTML elementy
class HTMLElement:
    def __init__(self, tag, attributes=None, content=None):  # Inicializuje HTML element s tagem, atributy a obsahem
        self.tag = tag
        self.attributes = attributes or {} # Slovník atributů, výchozí je prázdný slovník
        self.content = content or [] # Obsah elementu, výchozí je prázdný seznam

    def render(self): 
        # Vytvoří HTML kód z objektu
        # Zpracuje atributy do formátu 'key="value"'
        attrs = " ".join(f'{key}="{value}"' for key, value in self.attributes.items())
        opening_tag = f"<{self.tag} {attrs}>".strip()
        closing_tag = f"</{self.tag}>" if self.tag not in ('input', 'img') else ''
        # Obsah elementu může být jiný HTML element (rekurze) nebo text
        inner_content = "".join(element.render() if isinstance(element, HTMLElement) else str(element) for element in self.content)
        # Vrátí celý HTML řetězec
        return f"{opening_tag}{inner_content}{closing_tag}"

# Specifické třídy pro různé HTML elementy
class Input(HTMLElement):
    def __init__(self, type="text", attributes=None):
        attributes = attributes or {}
        attributes["type"] = type
        super().__init__("input", attributes)

class Select(HTMLElement):
    def __init__(self, options, attributes=None):
        content = [HTMLElement("option", {"value": key}, [value]) for key, value in options.items()]
        super().__init__("select", attributes, content)

class Anchor(HTMLElement):
    def __init__(self, href, content, attributes=None):
        attributes = attributes or {}
        attributes["href"] = href
        super().__init__("a", attributes, [content])

class Image(HTMLElement):
    def __init__(self, src, alt="", attributes=None):
        attributes = attributes or {}
        attributes.update({"src": src, "alt": alt})
        super().__init__("img", attributes)

class Div(HTMLElement):
    def __init__(self, content=None, attributes=None):
        super().__init__("div", attributes, content)

class Form(HTMLElement):
    def __init__(self, action, method="post", content=None, attributes=None):
        attributes = attributes or {}
        attributes.update({"action": action, "method": method})
        super().__init__("form", attributes, content)

# Vytvoření formuláře pomocí objektové reprezentace
form = Form(
    action="/submit",
    content=[
        Div([
            HTMLElement("label", {"for": "username"}, ["Username:"]),
            Input(attributes={"id": "username", "name": "username"}),
        ]),
        Div([
            HTMLElement("label", {"for": "password"}, ["Password:"]),
            Input(type="password", attributes={"id": "password", "name": "password"}),
        ]),
        Div([
            HTMLElement("label", {"for": "options"}, ["Options:"]),
            Select(
                options={"1": "Option 1", "2": "Option 2"},
                attributes={"id": "options", "name": "options"}
            ),
        ]),
        Div([
            Anchor(href="/forgot-password", content="Forgot Password?"),
        ]),
        Div([
            Input(type="submit", attributes={"value": "Submit"}),
        ]),
    ]
)

# Výpis vygenerovaného HTML kódu
print(form.render())
