require 'spec_helper'
require_relative '../robot'

describe Robot do
  let(:robot) { Robot.new }
  let(:x) { 2 }
  let(:y) { 2 }
  let(:f) { 'north' }

  describe '#place' do
    subject { robot.report }

    before do
      robot.place(x, y, f)
    end

    context 'with invalid x' do
      let(:x) { 5 }

      it { is_expected.to eq '1,0,' }
    end

    context 'with invalid y' do
      let(:y) { 5 }

      it { is_expected.to eq '0,0,' }
    end

    context 'with invalid f' do
      let(:f) { nil }

      it { is_expected.to eq '0,0,' }
    end

    context 'with valid arguments' do
      it { is_expected.to eq '2,2,north' }
    end
  end

  describe '#move' do
    subject { robot.report }

    before do
      robot.place(x, y, f)
      robot.move
    end

    context 'facing north' do
      context 'within bounds' do
        it { is_expected.to eq '2,3,north' }
      end

      context 'out of bounds' do
        let(:y) { 4 }

        it { is_expected.to eq '2,4,north' }
      end
    end

    context 'facing south' do
      let(:f) { 'south' }

      context 'within bounds' do
        it { is_expected.to eq '2,1,south' }
      end

      context 'out of bounds' do
        let(:y) { 0 }

        it { is_expected.to eq '2,0,south' }
      end
    end

    context 'facing east' do
      let(:f) { 'east' }

      context 'within bounds' do
        it { is_expected.to eq '3,2,east' }
      end

      context 'out of bounds' do
        let(:x) { 4 }

        it { is_expected.to eq '4,2,east' }
      end
    end

    context 'facing west' do
      let(:f) { 'west' }

      context 'within bounds' do
        it { is_expected.to eq '1,2,west' }
      end

      context 'out of bounds' do
        let(:x) { 0 }

        it { is_expected.to eq '0,2,west' }
      end
    end
  end

  describe '#rotate' do
    let(:direction) { nil }

    subject { robot.report }

    before do
      robot.place(x, y, f)
      robot.rotate(direction)
    end

    context 'invalid direction' do
      it { is_expected.to eq '2,2,north' }
    end

    context 'left' do
      let(:direction) { 'left' }

      context 'facing north' do
        it { is_expected.to eq '2,2,west' }
      end

      context 'facing south' do
        let(:f) { 'south' }

        it { is_expected.to eq '2,2,east' }
      end

      context 'facing east' do
        let(:f) { 'east' }

        it { is_expected.to eq '2,2,north' }
      end

      context 'facing west' do
        let(:f) { 'west' }

        it { is_expected.to eq '2,2,south' }
      end
    end

    context 'right' do
      let(:direction) { 'right' }

      context 'facing north' do
        it { is_expected.to eq '2,2,east' }
      end

      context 'facing south' do
        let(:f) { 'south' }

        it { is_expected.to eq '2,2,west' }
      end

      context 'facing east' do
        let(:f) { 'east' }

        it { is_expected.to eq '2,2,south' }
      end

      context 'facing west' do
        let(:f) { 'west' }

        it { is_expected.to eq '2,2,north' }
      end
    end
  end
end
