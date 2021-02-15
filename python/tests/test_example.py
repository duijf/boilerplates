from hypothesis import given
from hypothesis.strategies import integers


@given(val=integers())
def test_example(val: int) -> None:
    assert isinstance(val, int)
