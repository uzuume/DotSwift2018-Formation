precedencegroup Apply {
    associativity: left
}

infix operator |>: Apply //  x |> f  is f(x)

public func |> <Input, Output>(x: Input, f: (Input) -> Output) -> Output {
    return f(x)
}

precedencegroup ApplyBackwards {
    associativity: right
}

infix operator <|: ApplyBackwards // f <| x is f(x)

public func <| <Input, Output>(f: (Input) -> Output, x: Input) -> Output {
    return f(x)
}

precedencegroup Compose {
    associativity: right
    higherThan: Apply
}

infix operator >>> : Compose // f >>> g is x -> g(f(x))  or g o f

public func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return {x in g(f(x))}
}

infix operator <<<: Compose // g <<< f is x -> g(f(x))  or g o f

public func <<< <A, B, C>(g: @escaping (B) -> C, f: @escaping (A) -> B) -> (A) -> C {
    return {x in g(f(x))}
}

